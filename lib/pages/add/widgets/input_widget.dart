import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/tip_input_field.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopInputWidget extends StatelessWidget {


  final _sysController = TextEditingController();
  final _diaController = TextEditingController();
  final _pulseController = TextEditingController();
  final _sysFocus = FocusScopeNode();
  final _diaFocus = FocusScopeNode();
  final _pulseFocus = FocusScopeNode();

  TopInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPageViewModelProvider);
    return Column(
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
                      controller: _sysController,
                      width: 70.0,
                      placeholder: '120',
                      maxLength: 3,
                      focusNode: _sysFocus,
                      valueChanged: () {
                        final int? sys = _getValue(_sysController);
                        viewModel.sys = sys;
                        _checkForUnFocus(context);
                      },
                    ),
                    const Text(
                      "DIA",
                      style: Styles.headerNormal,
                    ),
                    InputField(
                      width: 70.0,
                      placeholder: '80',
                      controller: _diaController,
                      focusNode: _diaFocus,
                      valueChanged: () {
                        final int? dia = _getValue(_diaController);
                        viewModel.dia = dia;
                        _checkForUnFocus(context);
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
                  controller: _pulseController,
                  focusNode: _pulseFocus,
                  actionDone: true,
                  valueChanged: () {
                    final int? pulse = _getValue(_pulseController);
                    viewModel.pulse = pulse;
                    _checkForUnFocus(context);
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

  void _checkForUnFocus(context) {
    if (_sysController.text.length >= 3 &&
        _diaController.text.length >= 2 &&
        _pulseController.text.length >= 2) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
