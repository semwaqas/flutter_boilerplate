import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_started_boilerplate/injection_container.dart';
import 'package:get_storage/get_storage.dart';
import '../services/log/log.dart';
import 'lifecycle_handler.dart';

class Initializer {
  static const initializerTag = 'Initialization';

  init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return Container();
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        kLog(details.stack.toString(),
            logStatus: LogStatus.ERROR, tag: initializerTag);
      };
      await _initServices();
      runApp();
    }, (error, stack) {
      kLog('runZonedGuarded: ${error.toString()}',
          logStatus: LogStatus.ERROR, tag: initializerTag);
    });
  }

  static Future<void> _initServices() async {
    try {
      _initDependencies();
      await _initStorage();
      _initScreenPreference();
      WidgetsBinding.instance.addObserver(Handler());
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static Future<void> _initDependencies() async {
    await initializeDependencies();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
