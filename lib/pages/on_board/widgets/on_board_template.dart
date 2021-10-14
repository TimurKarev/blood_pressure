import 'package:blood_pressure/pages/home/home_page_landing.dart';
import 'package:blood_pressure/pages/home/widgets/empty_home_screen.dart';
import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardTemplate extends StatelessWidget {
  final String imagePath;
  final Widget textOrButton;
  final bool isTappable;

  const OnBoardTemplate({
    Key? key,
    required this.imagePath,
    required this.textOrButton,
    this.isTappable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 3,
              child: Image.asset(imagePath),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                child: Center(child: textOrButton),
                onTap: () {
                  _openDialog(context);
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 1,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                color: Styles.buttonColor,
                disabledColor: Styles.buttonDisableColor,
                child: const Text(
                  "Next",
                  style: Styles.base,
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      const HomeFullPage() ), (Route<dynamic> route) => false);
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _openDialog(ctx) {
    showCupertinoDialog(
        context: ctx,
        builder: (_) => CupertinoAlertDialog(
              title: Text("This is the title"),
              content: Text("This is the content"),
              actions: [
                // Close the dialog
                // You can use the CupertinoDialogAction widget instead
                CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    }),
                CupertinoButton(
                  child: Text('I agree'),
                  onPressed: () {
                    // Do something
                    print('I agreed');

                    // Then close the dialog
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }
}
