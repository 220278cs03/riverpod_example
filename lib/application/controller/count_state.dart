// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_state.freezed.dart';

@freezed
class CountState with _$CountState {
  const factory CountState({
    @Default(0) int count,
    @Default([]) List list,
  }) = _CountState;
}

// class CountState{
//   int count;
//   List? listOfName;
//
//   CountState({this.count = 0, this.listOfName});
//
//   CountState copyWith({int? count, List? listOfName}){
//     return CountState(count: count ?? this.count, listOfName: listOfName ?? this.listOfName);
//   }
// }
