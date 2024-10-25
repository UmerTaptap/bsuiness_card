import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/network/api.dart';
import 'core/globals/app_constants.dart';
import 'core/globals/blocs/theme/theme_bloc.dart';
import 'core/managers/sf_manager.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/home/models/v_card_model.dart';
import 'features/home/repository/home_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI() async {

  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(VCardModelAdapter());
  var vCardBox = await Hive.openBox<VCardModel>(AppConstants.VCARD_BOX);
  sl.registerSingleton<Box<VCardModel>>(vCardBox);


  // Singletons
  SfManager sfManager = SfManager();
  await sfManager.init();

  // Configs
  sl.registerSingleton<Api>(Api());

  // Global Blocs
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());

  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepository(sl<Box<VCardModel>>()));

  // Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl<HomeRepository>()));
}