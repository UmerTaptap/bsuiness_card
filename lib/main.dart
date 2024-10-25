import 'package:bot_toast/bot_toast.dart';
import 'package:business_card_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'core/custom/themes/app_theme.dart';
import 'core/globals/blocs/theme/theme_bloc.dart';
import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency injection
  await initDI();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => sl<ThemeBloc>(),
      ),

      BlocProvider<HomeBloc>(
        create: (context) => sl<HomeBloc>(),
      ),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {


    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          print("state: $state");
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Business Card App',
            theme: state is ThemeLight ? AppThemes(context).lightTheme : AppThemes(context).darkTheme,
            routerDelegate: Routes.router.routerDelegate,
            routeInformationParser: Routes.router.routeInformationParser,
            routeInformationProvider: Routes.router.routeInformationProvider,
            builder: BotToastInit(),

          );
        },
      ),
    );
  }
}
