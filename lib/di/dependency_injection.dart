import 'package:get_it/get_it.dart';

import '../facade/main_facade.dart';
import '../repo/main_repo.dart';
import '../user_model.dart';

GetIt getIt = GetIt.instance;

Future setUpRepo() async {
  getIt.registerSingleton<MainFacade>(MainRepo());
  getIt.registerLazySingleton<UserModel>(() => UserModel());
}

final mainRepo = getIt.get<MainFacade>();