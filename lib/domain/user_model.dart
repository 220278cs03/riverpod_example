class UserModel {
  String? name;

  UserModel({this.name});

  set setName(String name) {
    this.name = name;
  }

  get getName => name;
}
