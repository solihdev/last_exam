import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/state_manager/cubit/cards_cubit.dart';
import 'package:last_exam/state_manager/provider/card_provider.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';
import 'package:last_exam/ui/cards/cards/cards_page.dart';
import 'package:last_exam/ui/cards_page.dart';
import 'package:last_exam/utils/router/app_router.dart';
import 'package:last_exam/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => EditCardProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CardProvider(),
          ),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => CardsCubit(),
          ),
        ], child: const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          title: 'Zamin Education',
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: AppRoutes.generateRote,
          // initialRoute: RouteName.splash,
          home: AllCardsPage(),
          // home: const CardsPage(),
        ),
      ),
    );
  }
}
