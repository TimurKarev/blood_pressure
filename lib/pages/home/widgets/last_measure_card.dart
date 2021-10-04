import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/empty_card.dart';
import 'package:blood_pressure/pages/home/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastMeasureCard extends ConsumerWidget {
  const LastMeasureCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Measurement? measurement = watch(viewModelProvider).lastMeasurement;
    return measurement != null ? InfoCard(measurement) : const EmptyCard();
  }
}
