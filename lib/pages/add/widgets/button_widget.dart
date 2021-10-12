import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  ButtonWidget({
    Key? key,
  }) : super(key: key);

  final enableProvider = Provider<bool>(
      (ref) => ref.watch(addPageViewModelProvider).enableButton);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final enable = watch(enableProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          color: Styles.buttonColor,
          disabledColor: Styles.buttonDisableColor,
          child: Text(
            context.read(addPageViewModelProvider).buttonText,
            style: Styles.base,
          ),
          onPressed: enable ? () {
            context.read(addPageViewModelProvider).buttonPressed();
          } : null,
        ),
      ),
    );
  }
}
