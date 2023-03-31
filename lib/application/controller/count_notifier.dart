import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/facade/main_facade.dart';
import 'count_state.dart';

class CounterNotifier extends StateNotifier<CountState> {
  final MainFacade mainFacade;

  CounterNotifier(this.mainFacade) : super(const CountState());

  void increment() {
    mainFacade.getInfo("name");
    int count = state.count;
    state = state.copyWith(count: count);
  }

  addName(String name) {
    List names = state.list;
    names.add(name);
    state = state.copyWith(list: names);
  }
}
