import 'package:blood_pressure/pages/on_board/widgets/legal_widget.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OnBoardTemplate extends StatelessWidget {
  final String imagePath;
  final Widget textOrButton;
  final bool isTappable;
  final Function() onPressed;
  final String buttonText;
  final bool legalWidget;

  const OnBoardTemplate({
    Key? key,
    required this.imagePath,
    required this.textOrButton,
    this.isTappable = false,
    required this.onPressed,
    required this.buttonText,
    this.legalWidget = false,
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
                  //_openDialog(context);
                  _showRatingAppDialog(context);
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
                child: Text(
                  buttonText,
                  style: Styles.base,
                ),
                onPressed: () {
                  onPressed();
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: legalWidget ? const LegalWidget() : Container(),
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

  void _showRatingAppDialog(context) {
    final _ratingDialog = RatingDialog(
      ratingColor: Colors.amber,
      title: 'Rate the app',
      message: 'Tap a star to rate. Tou can also leave a'
          ' comment',
      image: Image.asset(
        "assets/png/blood_pressure_dialog_icon.png",
        height: 100,
      ),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
