import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final double width;
  final int maxLength;
  final String placeholder;
  //final bool actionDone;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function() onEditingComplete;

  const InputField({
    Key? key,
    this.maxLength = 2,
    required this.width,
    required this.placeholder,
    required this.controller,
    this.focusNode,
    //required this.update,
    required this.onEditingComplete,
 //   this.actionDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Focus(
        onFocusChange: (bool focus) {
          if (!focus) {
            onEditingComplete();
          }
        },
        child: CupertinoTextField(
          keyboardType: TextInputType.number,
          padding: const EdgeInsets.all(1.0),
          controller: controller,
          placeholder: placeholder,
          maxLength: maxLength,
          maxLines: 1,
          minLines: 1,
          style: Styles.textInputText,
          cursorColor: Styles.cursorColor,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          //onChanged: (_) => update,
          onEditingComplete: onEditingComplete,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
