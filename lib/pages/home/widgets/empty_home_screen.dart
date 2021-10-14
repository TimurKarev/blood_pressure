import 'package:blood_pressure/pages/home/widgets/empty_card.dart';
import 'package:blood_pressure/pages/utils/top_angles_clipper.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Styles.emptyPageColor,
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Home",
                        style: Styles.headerNormal
                            .copyWith(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: EmptyCard(),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 1,
              builder: (context, controller) => ClipPath(
                clipper: TopAnglesClipper(radius: 20.0),
                child: Container(
                  color: CupertinoColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("History:", style: Styles.headerNormal),
                        const SizedBox(height: 10),
                        Text("Waiting for you results",
                            style: Styles.base
                                .copyWith(color: CupertinoColors.inactiveGray)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
