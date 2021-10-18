import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/pages/on_board/widgets/on_board_template.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController controller = PageController(initialPage: 0);

  static const List<String> _imagePath = [
    "assets/png/on_board/on_board_1.png",
    "assets/png/on_board/on_board_2.png",
    "assets/png/on_board/on_board_3.png",
    "assets/png/on_board/on_board_4.png",
  ];

  static const List<String> _headers = [
    "Track your health",
    "Help us to improve the app",
    "Detailed tracking",
    "Starts & Analysis",
  ];

  static const List<String> _text = [
    "Monitor your pulse and blood pressure",
    "We constantly monitor feedback and need your opinion",
    "Collecting all the information about your condition and analyzing it",
    "Subscribe to unlock all the features, just \$3.99/w",
  ];

  static final List<Widget> _widgets = [
    TextWidget(header: _headers[0], text: _text[0]),
    TextWidget(header: _headers[1], text: _text[1]),
    TextWidget(header: _headers[2], text: _text[2]),
    TextWidget(header: _headers[3], text: _text[3]),
  ];

  final Curve curve = Curves.easeInOut;
  final Duration duration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: [
              OnBoardTemplate(
                imagePath: _imagePath[0],
                textOrButton: _widgets[0],
                buttonText: "Next",
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                imagePath: _imagePath[1],
                textOrButton: _widgets[1],
                buttonText: "Next",
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                imagePath: _imagePath[2],
                textOrButton: _widgets[2],
                buttonText: "Next",
                isTappable: true,
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                  imagePath: _imagePath[3],
                  textOrButton: _widgets[3],
                  buttonText: "Continue",
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                //TODO: Fix landing logic HomeFullPage - is not the best solution
                                const HomeFullPage()),
                        (Route<dynamic> route) => false);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String header;
  final String text;

  const TextWidget({
    Key? key,
    required this.header,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Text(header, style: Styles.headerNormal)),
      const SizedBox(height: 20.0),
      Center(
          child: Text(
        text,
        style: Styles.base,
        textAlign: TextAlign.center,
        //overflow: TextOverflow.ellipsis,
      )),
    ]);
  }
}
