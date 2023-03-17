import 'package:get_it/get_it.dart';

import 'controller/provider_helper.dart';
import 'data/local_data_source.dart';

final getIt = GetIt.instance;

Future init() async {
  getIt.registerFactory<MyProvider>(() => MyProvider(sqlDatabase: getIt()));

  getIt.registerLazySingleton(() => SQLDatabase());
}
