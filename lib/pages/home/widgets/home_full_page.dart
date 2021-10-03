import 'package:blood_pressure/pages/home/widgets/bottom_button.dart';
import 'package:blood_pressure/pages/home/widgets/empty_card.dart';
import 'package:flutter/cupertino.dart';

class HomeFullPage extends StatelessWidget {
  const HomeFullPage({Key? key}) : super(key: key);

  static const statistic = 0;
  static const add = 1;
  static const settings = 2;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Column(
            children: [
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Center(
                  child: Text("Home"),
                ),
              ),
              const Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: EmptyCard(),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1,
            builder: (context, controller) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: CupertinoColors.lightBackgroundGray,
                child: Column(
                  children: const [
                    Text("History"),
                    Text("Waiting for you results"),
                  ],
                ),
              ),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 20,
                  child: Container(),
                ),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: CupertinoColors.activeOrange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          BottomButton(
                            text: "Statistic",
                            icon: Icon(CupertinoIcons.chart_bar_fill),
                          ),
                          BottomButton(
                            text: "Add",
                            icon: Icon(CupertinoIcons.add),
                          ),
                          BottomButton(
                            text: "Settings",
                            icon: Icon(CupertinoIcons.settings),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
