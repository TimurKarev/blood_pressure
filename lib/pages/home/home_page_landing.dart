import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/pages/home/widgets/empty_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageLanding extends ConsumerWidget {
  const HomePageLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<bool> measurements = watch(isHistoryEmptyProvider);
    return measurements.when(
      data: (data) {
        if (data) {
          return const HomeFullPageLanding();
        }
        return const EmptyHomeScreen();
      },
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      error: (error, _) => Text(
        error.toString(),
      ),
    );
  }
}