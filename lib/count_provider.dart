import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exapmle/count_notifier.dart';
import 'package:riverpod_exapmle/count_state.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, CountState>((ref) {
  return CounterNotifier();
});