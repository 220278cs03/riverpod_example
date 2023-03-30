class CountState{
  int count;
  List? listOfName;

  CountState({this.count = 0, this.listOfName});

  CountState copyWith({int? count, List? listOfName}){
    return CountState(count: count ?? this.count, listOfName: listOfName ?? this.listOfName);
  }
}