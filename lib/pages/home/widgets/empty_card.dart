import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/add/add_page.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset('assets/svg/hand.svg'),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 48.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                color: Styles.buttonColor,
                onPressed: () {
                  showGeneralDialog(
                      context: context,
                      pageBuilder: (BuildContext ctx, Animation animation,
                          Animation secondAnimation) {
                        return const AddPage();
                      });
                },
                child: const Text(
                  "Enter the first measurement",
                  style: Styles.base,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
