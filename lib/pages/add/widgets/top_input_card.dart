import 'package:blood_pressure/pages/add/view_model/add_page_view_model.dart';
import 'package:blood_pressure/pages/common_widgets/measurement_row.dart';
import 'package:blood_pressure/styles.dart';
import 'package:blood_pressure/utils/color_to_diag_mapping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';

//TODO: Refactor ME

class TopInputCard extends StatelessWidget {
  const TopInputCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(addPageViewModelProvider);
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: MeasurementRow(
            sys: viewModel.sys.toString(),
            dia: viewModel.dia.toString(),
            pulse: viewModel.pulse.toString(),
            badgeText: viewModel.bageText,
            type: CardType.input,
          ),
        ),
      ),
    );
  }
}
