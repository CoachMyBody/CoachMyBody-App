import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  // https://www.figma.com/file/SoQShDNTuCUo6uxsnkIGeu/CoachMyBody?node-id=40%3A64
  static Color cmb_blue = cmb_accent[100];

  static const Map<int, Color> cmb_accent = const <int, Color>{
    10: const Color.fromARGB(0x19, 0x23, 0x55, 0xF5),
    30: const Color.fromARGB(0x4C, 0x23, 0x55, 0xF5),
    60: const Color.fromARGB(0x99, 0x23, 0x55, 0xF5),
    80: const Color.fromARGB(0xCC, 0x23, 0x55, 0xF5),
    100: const Color.fromARGB(0xFF, 0x23, 0x55, 0xF5),
  };

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
