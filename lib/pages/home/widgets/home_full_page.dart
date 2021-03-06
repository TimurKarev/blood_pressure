import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/add/add_page.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/bottom_button.dart';
import 'package:blood_pressure/pages/home/widgets/history_widget.dart';
import 'package:blood_pressure/pages/home/widgets/last_measure_card.dart';
import 'package:blood_pressure/pages/settings/settings_page.dart';
import 'package:blood_pressure/pages/statistic/statistic_page.dart';
import 'package:blood_pressure/utils/diag_mapping.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext ctx, Animation animation,
                Animation secondAnimation) {
              return const AddPage();
            });
        break;
      case ButtonButtonEnum.statistic:
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext ctx, Animation animation,
                Animation secondAnimation) {
              return StatisticPage();
            });
        break;
      case ButtonButtonEnum.settings:
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext ctx, Animation animation,
                Animation secondAnimation) {
              return const SettingsPage();
            });
        break;
    }
  }

//TODO: Add gradient
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Consumer(
            builder: (BuildContext context,
                T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
              Measurement? measurement =
                  watch(viewModelProvider).lastMeasurement;
              return Container(
                color: measurement == null
                    ? Styles.emptyPageColor
                    : getColorFromDiag(measurement.diagnosis),
              );
            },
          ),
          Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Home",
                      style: Styles.headerNormal
                          .copyWith(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ),
              const Flexible(
                flex: 6,
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
                flex: 10,
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
                    height: 75.0,
                    child: Container(
                      color: Styles.backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //TODO: Change Icons on Buttons
                          BottomButton(
                            text: "Statistic",
                            imagePath: "assets/png/statistic.png",
                            button: ButtonButtonEnum.statistic,
                            callbackFunction: (ButtonButtonEnum btnPressed) =>
                                buttonPressed(context, btnPressed),
                          ),
                          BottomButton(
                            text: "Add",
                            imagePath: "assets/png/add.png",
                            button: ButtonButtonEnum.add,
                            callbackFunction: (ButtonButtonEnum btnPressed) =>
                                buttonPressed(context, btnPressed),
                          ),
                          BottomButton(
                            text: "Settings",
                            imagePath: "assets/png/settings.png",
                            callbackFunction: (ButtonButtonEnum btnPressed) =>
                                buttonPressed(context, btnPressed),
                            button: ButtonButtonEnum.settings,
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
