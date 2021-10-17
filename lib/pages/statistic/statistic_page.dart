import 'package:blood_pressure/pages/statistic/view_model/statictic_view_model.dart';
import 'package:blood_pressure/pages/statistic/widgets/chart_widget.dart';
import 'package:blood_pressure/pages/statistic/widgets/radio_set_widget.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';

class StatisticPage extends StatelessWidget {
  StatisticPage({Key? key}) : super(key: key);

  final pulsePressureProvider =
      Provider((ref) => ref.watch(statisticViewModelProvider).measure);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(statisticViewModelProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: Scaffold(
          body: Column(
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
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Consumer(
                  builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object?, T>) watch,
                      Widget? child) {
                    int index = watch(pulsePressureProvider);
                    return RadioSetWidget(
                      labels: const ["Day", "Week", "Month", "Year"],
                      startIndex: viewModel.interval,
                      onPressed: (int index) {
                        viewModel.interval = index;
                      },
                      colorIndex: index,
                    );
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Consumer(
                  builder: (BuildContext context,
                      T Function<T>(ProviderBase<Object?, T>) watch,
                      Widget? child) {
                    int index = watch(pulsePressureProvider);
                    return RadioSetWidget(
                      labels: const ["Blood Pressure", "Pulse"],
                      colorIndex: index,
                      startIndex: viewModel.measure,
                      onPressed: (int index) {
                        viewModel.measure = index;
                      },
                    );
                  },
                ),
              ),
              Consumer(
                builder: (BuildContext context,
                    T Function<T>(ProviderBase<Object?, T>) watch,
                    Widget? child) {
                  final vm = watch(statisticViewModelProvider);
                  return Expanded(
                    child: ChartWidget(
                      historyDates: vm.getChartData(),
                      colorInd: vm.measure,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
