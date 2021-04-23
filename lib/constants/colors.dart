import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  // https://www.figma.com/file/SoQShDNTuCUo6uxsnkIGeu/CoachMyBody?node-id=40%3A64
  static const Color cmb_blue = Color(0xFF1CB9FF);

  // https://www.figma.com/file/SoQShDNTuCUo6uxsnkIGeu/CoachMyBody?node-id=40%3A7
  static const Map<int, Color> cmb_grey = const <int, Color>{
    00: const Color(0xFFFFFFFF),
    50: const Color(0xFFF6F8F9),
    100: const Color(0xFFE9EDEF),
    200: const Color(0xFFBFC6CD),
    300: const Color(0xFF9AA5AF),
    400: const Color(0xFF77818B),
    500: const Color(0xFF4D5C6A),
    600: const Color(0xFF2D3843),
    700: const Color(0xFF11171C),
    800: const Color(0xFF000000),
  };
}
