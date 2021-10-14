import 'package:blood_pressure/pages/statistic/widgets/badge_widget.dart';
import 'package:blood_pressure/pages/statistic/widgets/interval_set_widget.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: CupertinoPageScaffold(
          child: Column(
            children: [
              //TODO: make separate widget
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    const Flexible(
                      flex: 8,
                      child: Text(
                        "Statistic",
                        style: Styles.headerNormal,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.bottomRight,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          size: 27,
                          color: Styles.iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RadioSetWidget(
                  labels: ["Day", "Week", "Month", "Year"],
                ),
              ),
              SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RadioSetWidget(
                  labels: ["Blood Pressure", "Pulse"],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
