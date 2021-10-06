import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPageViewModelProvider =
    ChangeNotifierProvider<AddPageViewModel>((ref) => AddPageViewModel());

enum CompleteStatus {
  none,
  sys,
  dia,
  pulse,
  button,
}

class AddPageViewModel extends ChangeNotifier {
  CompleteStatus pageStatus = CompleteStatus.none;

  int? _sys;
  int? _dia;
  int? _pulse;

  set sys(int value) {
    _sys = value;
  }

}
