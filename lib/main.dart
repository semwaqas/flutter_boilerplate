import 'package:flutter/material.dart';
import 'package:get_started_boilerplate/core/utils/initializer.dart';
import 'package:get_started_boilerplate/core/utils/language.dart';
import 'package:get_started_boilerplate/features/initial/initial_material_app.dart';

/// ~Note: If you encounter security warnings while building the app,
/// select "Run Anyway" to proceed.

///Goto [InitialPage] to setup starting pages of your applications.
///
/// Goto [InitMaterialApp] to setup Material App of your application.
///
///Goto [RouteServices] to setup routes of your application.
///
///Goto [Constants] to specify [ENV] & [Constants.appName].
///
///Setup your
///
///[pubspec.yaml],
///
///[package_rename_config.yaml]
///
/// To add a new feature/screen through mason:
/// 1. Install Mason by running:
///    [dart pub global activate mason_cli]
/// 
/// 2. Run [mason get]
///
/// 3. Run the following command to create the feature:
///    [mason make feature]
///
/// Ensure that Dart is properly installed and configured before running the commands.
/// press runanyway

void main() {
  ///NOTE:- All initializer things for different projects must be added in [Initializer] class's init method.
  Initializer().init(() {
    runApp(
      const LanguageInitializer(
        InitialMaterialApp(),
      ),
    );
  });
}