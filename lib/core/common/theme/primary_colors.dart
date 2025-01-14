import 'dart:ui';

class PrimaryColors {
  // Pink
  static Color get pink300 => const Color(0XFFFB7181);

  static Color get pink => const Color(0xFFE74981);

  static Color get darkPink => const Color(0xFFC90047);

  static Color get orange => const Color(0xFFFF875D);

  // Blue
  static Color get blue50 => const Color(0xFFEAEFFF);

  static Color get blueA200 => const Color(0xFF4091FF);

  // BlueGray
  Color get blueGray300 => const Color(0xFF9098B1);

  static Color get blueGray => const Color(0xFF666B8F);

  static Color get darkBlueGray => const Color(0xFF273156);

  static Color get lightGray => const Color(0xFFE5E5E5);

  static Color get darkGray => const Color(0xFF4D4D4D);
}

class ThemeColors {
  final Color random;

  const ThemeColors({
    required this.random,
  });

  static ThemeColors light = const ThemeColors(
    random: Color(0xFFEFEFEF),
  );

  static ThemeColors dark = const ThemeColors(
    random: Color(0xFF000000),
  );
}
