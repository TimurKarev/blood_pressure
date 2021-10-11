import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/text_icon_widget.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';

class FeelWidget extends StatefulWidget {
  const FeelWidget({Key? key}) : super(key: key);

  @override
  State<FeelWidget> createState() => _FeelWidgetState();
}

class _FeelWidgetState extends State<FeelWidget> {
  List<bool> _statusList = [false, false, false];

  void onTap(int index) {
    setState(() {
      _statusList = [false, false, false];
      _statusList[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 10,
          child: TextIconWidget(
            isActive: _statusList[0],
            text: "Good",
            iconAssetPath: "assets/png/good_grey.png",
            activeColor: Styles.badgeGoodColor,
            onTap: () {
              context.read(addPageViewModelProvider).feelChoiceChanged(0);
              onTap(0);
            },
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 10,
          child: TextIconWidget(
            isActive: _statusList[1],
            text: "Normal",
            iconAssetPath: "assets/png/normal_grey.png",
            activeColor: Styles.badgeNormalColor,
            onTap: () {
              context.read(addPageViewModelProvider).feelChoiceChanged(1);
              onTap(1);
            },
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 10,
          child: TextIconWidget(
            isActive: _statusList[2],
            text: "Bad",
            iconAssetPath: "assets/png/bad_grey.png",
            activeColor: Styles.badgeBadColor,
            onTap: () {
              context.read(addPageViewModelProvider).feelChoiceChanged(2);
              onTap(2);
            },
          ),
        ),
      ],
    );
  }
}
