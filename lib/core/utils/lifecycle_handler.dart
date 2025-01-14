import 'package:flutter/cupertino.dart';
import 'package:get_started_boilerplate/core/common/strings/strings.dart';
import 'package:get_started_boilerplate/core/services/log/log.dart';

class Handler extends WidgetsBindingObserver {
  static const handlerTag = 'Handler';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      kLog("${Strings.appName} resumed",
          tag: handlerTag, logStatus: LogStatus.INFO);
    }
    if (state == AppLifecycleState.inactive) {
      kLog("${Strings.appName} inactive",
          tag: handlerTag, logStatus: LogStatus.INFO);
      kLog("App ");
    }
    if (state == AppLifecycleState.paused) {
      kLog("${Strings.appName} paused",
          tag: handlerTag, logStatus: LogStatus.INFO);
    }
    if (state == AppLifecycleState.detached) {
      kLog("${Strings.appName} detached",
          tag: handlerTag, logStatus: LogStatus.INFO);
    }
  }
}
