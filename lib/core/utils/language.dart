import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageInitializer extends StatelessWidget {
  final Widget widget;

  const LanguageInitializer(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: widget,
    );
  }
}
