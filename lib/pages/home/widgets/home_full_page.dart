import 'package:blood_pressure/pages/add/add_widget.dart';
import 'package:blood_pressure/pages/home/widgets/bottom_button.dart';
import 'package:blood_pressure/pages/home/widgets/history_widget.dart';
import 'package:blood_pressure/pages/home/widgets/last_measure_card.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum ButtonButtonEnum {
  statistic,
  add,
  settings,
}

class HomeFullPage extends StatelessWidget {
  //final List<Measurement> measurements;

  const HomeFullPage({Key? key}) : super(key: key);

  void buttonPressed(BuildContext context, ButtonButtonEnum button) {
    switch (button) {
      case ButtonButtonEnum.add:
        //context.read(viewModelProvider).addMeasurement(Measurement.random());
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext ctx, Animation animation,
                Animation secondAnimation) {
              return const AddWidget();
            });
        break;
      case ButtonButtonEnum.statistic:
      case ButtonButtonEnum.settings:
    }
  }

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
                  child: Text("Home", style: Styles.headerNormal,),
                ),
              ),
              const Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: LastMeasureCard(),
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
                child: HistoryWidget(
                  controller: controller,
                  //measurements: measurements,
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
                        children: [
                          // BottomButton(
                          //   text: "Statistic",
                          //   icon: Icon(CupertinoIcons.chart_bar_fill),
                          //   //button: ButtonButtonEnum.statistic,
                          //   callbackFunction: () {
                          //
                          //   },
                          // ),
                          BottomButton(
                            text: "Add",
                            icon: const Icon(CupertinoIcons.add),
                            button: ButtonButtonEnum.add,
                            callbackFunction: (ButtonButtonEnum btnPressed) =>
                                buttonPressed(context, btnPressed),
                          ),
                          // BottomButton(
                          //   text: "Settings",
                          //   icon: Icon(CupertinoIcons.settings),
                          // ),
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
