import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/bottom_widget.dart';
import 'package:blood_pressure/pages/add/widgets/button_widget.dart';
import 'package:blood_pressure/pages/add/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingInputWidget extends StatelessWidget {
  LandingInputWidget({
    Key? key,
  }) : super(key: key);

  final inputStageProvider = Provider<bool>(
      (ref) => ref.watch(addPageViewModelProvider).secondPartEdit);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 23,
          child: Consumer(
            builder: (BuildContext context,
                T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
              final isSecondStage = watch(inputStageProvider);
              return isSecondStage ? const BottomInputWidget() : TopInputWidget();
            },
          ),
        ),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ButtonWidget(),
          ),
        ),
      ],
    );
  }
}
