import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/add/widgets/landing_input_widget.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/src/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read(addPageViewModelProvider).init();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ClipPath(
        clipper: TopAnglesClipper(radius: 30.0),
        child: Scaffold(
          body: Container(
            color: Styles.primaryColor,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(),
                                ),
                                const Flexible(
                                  flex: 8,
                                  child: Text(
                                    "New Measurement",
                                    style: Styles.headerNormal,
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.bottomRight,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(
                                      CupertinoIcons.xmark_circle_fill,
                                      size: 27,
                                      color: Styles.iconColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 30,
                          child: LandingInputWidget(),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
