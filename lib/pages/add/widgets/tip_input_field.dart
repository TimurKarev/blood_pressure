import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final double width;
  final int maxLength;
  final String placeholder;

  final double borderRadius;

  final bool actionDone;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function() valueChanged;

  const InputField({
    Key? key,
    this.maxLength = 2,
    this.width = double.infinity,
    required this.placeholder,
    required this.controller,
    this.focusNode,
    //required this.update,
    required this.valueChanged,
    this.borderRadius = 7.0,
    this.actionDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.0,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        padding: const EdgeInsets.fromLTRB(5.0, 1.0, 1.0, 1.0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        controller: controller,
        placeholder: placeholder,
        maxLength: maxLength,
        maxLines: 1,
        minLines: 1,
        style: Styles.textInputText,
        cursorColor: Styles.cursorColor,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        //onChanged: (_) => update,
        //onEditingComplete: valueChanged,
        onChanged: (_) => valueChanged(),
        textInputAction: actionDone? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
