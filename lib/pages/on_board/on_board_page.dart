import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/pages/on_board/widgets/on_board_template.dart';
import 'package:blood_pressure/pages/on_board/widgets/onboard_text_widget.dart';
import 'package:blood_pressure/styles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  OnBoardPage({Key? key}) : super(key: key);
  final PageController controller = PageController(initialPage: 0);
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {


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
    OnBoardTextWidget(header: _headers[0], text: _text[0]),
    OnBoardTextWidget(header: _headers[1], text: _text[1]),
    OnBoardTextWidget(header: _headers[2], text: _text[2]),
    OnBoardTextWidget(header: _headers[3], text: _text[3]),
  ];

  final Curve curve = Curves.easeInOut;
  final Duration duration = const Duration(milliseconds: 400);
  double _currentPage = 0;


  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (_) {
              setState(() {
                _currentPage = controller.page ?? 0;
              });
            } ,
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
                legalWidget: true,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              //TODO: Fix landing logic HomeFullPage - is not the best solution
                              const HomeFullPage()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DotsIndicator(
                      dotsCount: 4,
                      position: _currentPage,
                      decorator: const DotsDecorator(
                        color: Styles.buttonDisableColor, // Inactive color
                        activeColor: Styles.buttonColor,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
