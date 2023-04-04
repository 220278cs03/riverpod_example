import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/di/dependency_injection.dart';
import '../../domain/model/user_model.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    UserModel user = getIt<UserModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? ""),
      ),
    );
  }
}
