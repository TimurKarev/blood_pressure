import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/pages/home/widgets/empty_home_screen.dart';
import 'package:blood_pressure/pages/on_board/on_board_page.dart';
import 'package:blood_pressure/pages/on_board/widgets/on_board_template.dart';
import 'package:blood_pressure/styles.dart';
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
      case HomePageLandingState.notEmpty:
        return const HomeFullPage();
      case HomePageLandingState.empty:
        //return const EmptyHomeScreen();
        return const OnBoardPage();
      case HomePageLandingState.loading:
        return Container(
          color: CupertinoColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/png/emblem.png"),
              Column(
                children: [
                  const Text("Blood Pressure", style: Styles.headerBig,),
                  Text("Monitor Tracker", style: Styles.headerBig.copyWith(color: Styles.buttonColor)),
                ],
              ),
            ],
          ),
        );
    }
  }
}
