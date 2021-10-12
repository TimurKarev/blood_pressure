import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';

//TODO: Move Consumer

class TimeWidget extends ConsumerWidget {
  TimeWidget({Key? key}) : super(key: key);

  final needColorProvider =
      Provider((ref) => ref.watch(addPageViewModelProvider).bottomInputStart);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final isColored = watch(needColorProvider);
    // final Color color =
    //     isColored ? CupertinoColors.black : CupertinoColors.inactiveGray;
    const _radius = 10.0;
    final Color color = CupertinoColors.black;

    final ButtonStyle _widgetStyle = TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: color,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
      ),
    );

    final viewModel = context.read(addPageViewModelProvider);
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          flex: 10,
          child: TextButton(
            onPressed: null,
            style: _widgetStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.calendar, color: color),
                Text(" " + viewModel.date,
                    style: Styles.base.copyWith(color: color)),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 10,
          child: TextButton(
            style: _widgetStyle,
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.clock, color: color),
                Text(" " + viewModel.time,
                    style: Styles.base.copyWith(color: color)),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
