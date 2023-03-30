import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exapmle/count_state.dart';

class CounterNotifier extends StateNotifier<CountState> {
  CounterNotifier() : super(CountState(count: 0));

  void increment(){
    state = state.copyWith(count: ++state.count);
  }

  addName(String name){
    List names = state.listOfName ?? [];
    names.add(name);
    state = state.copyWith(listOfName: names);
  }
}