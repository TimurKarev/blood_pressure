import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/text_icon_widget.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';

class PillsWidget extends StatefulWidget {
  const PillsWidget({Key? key}) : super(key: key);

  @override
  State<PillsWidget> createState() => _PillsWidgetState();
}

class _PillsWidgetState extends State<PillsWidget> {
  List<bool> _statusList = [false, false];
  bool _textFieldEnable = false;

  void onTap(int index) {
    setState(() {
      _statusList = [false, false];
      _statusList[index] = true;
      if (index == 0) {
        _textFieldEnable = false;
      } else {
        _textFieldEnable = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 10,
                child: TextIconWidget(
                  isActive: _statusList[0],
                  text: "No",
                  activeColor: CupertinoColors.black,
                  onTap: () {
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
                  text: "Yes",
                  activeColor: CupertinoColors.black,
                  onTap: () {
                    onTap(1);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: SizedBox(
            height: 40.0,
            child: CupertinoTextField(placeholder: "Name of Pills"),
          ),
        ),
      ],
    );
  }
}
