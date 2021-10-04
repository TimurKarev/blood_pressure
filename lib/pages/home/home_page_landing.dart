import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/pages/home/widgets/empty_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageLanding extends ConsumerWidget {
  HomePageLanding({Key? key}) : super(key: key);

  final homePageLandingProvider = Provider<HomePageLandingState>(
      (ref) => ref.watch(viewModelProvider).isEmptyState);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final widgetSate = watch(homePageLandingProvider);
    switch (widgetSate) {
      case HomePageLandingState.empty:
      case HomePageLandingState.loading:
        return const EmptyHomeScreen();
      case HomePageLandingState.notEmpty:
        return const HomeFullPage();
    }
  }
}
