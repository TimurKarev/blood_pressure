import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Column(
        children: [
          Flexible(
            flex: 7,
            child: Center(
              child: SvgPicture.asset('assets/svg/hand.svg'),
            ),
          ),
          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                context.read(viewModelProvider).addMeasurement(
                      Measurement.random(),
                    );
              },
              child: const Text("Enter the first measurement"),
            ),
          ),
        ],
      ),
    );
  }
}
