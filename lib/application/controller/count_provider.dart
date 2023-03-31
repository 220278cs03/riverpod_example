import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/di/dependency_injection.dart';
import 'count_notifier.dart';
import 'count_state.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CountState>((ref) {
  return CounterNotifier(mainRepo);
});
