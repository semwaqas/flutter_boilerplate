import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_started_boilerplate/core/common/constants/constants.dart';
import 'package:get_started_boilerplate/core/common/theme/theme.dart';
import 'package:get_started_boilerplate/core/routes/routes_service.dart';
import 'package:get_started_boilerplate/core/services/navigation/navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InitialMaterialApp extends StatelessWidget {
  const InitialMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        // providers: [
        // ],
        // child:
        MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigationKey,
      initialRoute: RouteServices.STARTING_POINT,
      routes: RouteServices.routes,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeHelper.getTheme(),
      theme: ThemeHelper.lightThemeData,
      darkTheme: ThemeHelper.darkThemeData,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
    // );
  }
}
