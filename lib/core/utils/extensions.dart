import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get_started_boilerplate/core/common/theme/primary_colors.dart';
import 'package:intl/intl.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension Convert on String {
  Future<String> imagePathToBase64String() async {
    Uint8List tempList = await File(this).readAsBytes();
    return "data:image/${split(".").last};base64,${base64Encode(tempList)}";
  }

  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

extension FormatCurrency on Double {
  String formatCurrency(String locale) {
    final format = NumberFormat.currency(locale: locale, symbol: '');
    return '${format.currencySymbol}${format.format(this)}';
  }
}

extension AppThemeColors on ThemeData {
  ThemeColors get colors {
    return brightness == Brightness.dark ? ThemeColors.dark : ThemeColors.light;
  }
}

extension WidgetModifiers on Widget {
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(8)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget center() {
    return Center(child: this);
  }

  Widget onTap({
    required VoidCallback onTap,
    BorderRadius? borderRadius,
    Color rippleColor = Colors.transparent,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Material(
        color: rippleColor,
        borderRadius: borderRadius,
        child: this,
      ),
    );
  }

  Widget gradient({required List<Color> colors}) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: this,
    );
  }
}

extension MediaQueryExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
