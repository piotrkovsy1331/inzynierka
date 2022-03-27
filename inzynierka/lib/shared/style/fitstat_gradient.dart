import 'package:flutter/material.dart';

///Gradients CustomColors for light and Dark theme needs to
class FitstatGradient {
  FitstatGradient(this.colors);
  List<Color> colors;

  static List<Color> sky = [
    const Color(0xFF6448FE),
    const Color(0xFF5FC6FF),
  ];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [
    const Color(0xFF61A3FE),
    const Color(0xFF63FFD5),
  ];
  static List<Color> mango = [
    const Color(0xFFFFA738),
    const Color(0xFFFFE130),
  ];
  static List<Color> fire = [
    const Color(0xFFFF5DCD),
    const Color(0xFFFF8484),
  ];

  static List<Color> skyDark = [
    const Color.fromARGB(255, 217, 116, 182),
    const Color.fromARGB(255, 92, 97, 219)
  ];
  static List<Color> sunsetDark = [
    const Color.fromARGB(255, 175, 53, 54),
    const Color.fromARGB(255, 238, 194, 48)
  ];
  static List<Color> seaDark = [
    const Color.fromARGB(255, 79, 132, 161),
    const Color.fromARGB(255, 167, 120, 229)
  ];
  static List<Color> mangoDark = [
    const Color.fromARGB(255, 164, 32, 44),
    const Color.fromARGB(255, 28, 40, 102)
  ];
  static List<Color> fireDark = [
    const Color.fromARGB(255, 126, 30, 87),
    const Color.fromARGB(255, 27, 20, 104)
  ];
}
