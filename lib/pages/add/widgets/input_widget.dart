import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopInputWidget extends StatelessWidget {
  final double _textFieldRadius = 6.0;

  final sysController = TextEditingController();
  final diaController = TextEditingController();
  final pulseController = TextEditingController();

  TopInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPageViewModelProvider);
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Container(),
        ),
        Flexible(
          flex: 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                  "SYS",
                  style: Styles.headerNormal,
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputField(
                      controller: sysController,
                      width: 70.0,
                      placeholder: '120',
                      maxLength: 31,
                      valueChanged: () {
                        final int? sys = _getValue(sysController);
                        viewModel.sys = sys;
                      },
                    ),
                    const Text(
                      "DIA",
                      style: Styles.headerNormal,
                    ),
                    InputField(
                      width: 70.0,
                      placeholder: '80',
                      controller: diaController,
                      valueChanged: () {
                        final int? dia = _getValue(diaController);
                        viewModel.dia = dia;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                  "Pulse",
                  style: Styles.headerSmall,
                ),
              ),
              Flexible(
                flex: 3,
                child: InputField(
                  //width: 70.0,
                  placeholder: '60',
                  controller: pulseController,
                  valueChanged: () {
                    final int? pulse = _getValue(pulseController);
                    viewModel.pulse = pulse;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int? _getValue(TextEditingController ctrl) {
    try {
      if (ctrl.text.length > 1) {
        final int retValue = int.parse(ctrl.text);
        return retValue;
      }
    } catch (e) {
      ctrl.text = "";
    }
    return null;
  }
}
