import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:flutter/cupertino.dart';
class AddWidget extends StatelessWidget {
  const AddWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: Container(
          color: CupertinoColors.lightBackgroundGray,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 8,
                      child: Text("New Measurement"),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(CupertinoIcons.xmark_circle_fill),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}