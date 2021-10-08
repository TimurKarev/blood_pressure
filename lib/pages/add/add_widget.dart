import 'package:blood_pressure/pages/add/widgets/input_widget.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: Container(
          color: Styles.primaryColor,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 20,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 30,
                      child: Column(
                        children: const [
                          Flexible(
                            flex: 3,
                            child: InputWidget(),
                          ),
                          Flexible(
                            flex: 7,
                            child: ButtonWidget(),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 18,
          child: SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: Styles.buttonColor,
              disabledColor: Styles.buttonDisableColor,
              child: Text("Continue", style: Styles.base,),
              onPressed: null,//() {  },
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
