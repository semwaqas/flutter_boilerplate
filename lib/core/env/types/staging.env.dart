import 'package:get_started_boilerplate/core/env/environment.dart';

class Staging extends Environment {
  @override
  String apiUrl() {
    return "";
  }

  @override
  String socketUrl() {
    return "";
  }

  @override
  int isBeta() {
    return 0;
  }
}