import 'package:flutter/material.dart';

abstract final class AppColors {

  static const Color gold      = Color(0xFFC9A96E);
  static const Color goldLight = Color(0xFFE8D5A3);
  static const Color goldDark  = Color(0xFF1A1240);

  static const Color orbPurple = Color(0xFFA855F7);
  static const Color orbBlue   = Color(0xFF3B82F6);

  static const Color white90  = Color(0xE6FFFFFF);
  static const Color white70  = Color(0xB3FFFFFF);
  static const Color white50  = Color(0x80FFFFFF);
  static const Color white20  = Color(0x33FFFFFF);
  static const Color white12  = Color(0x1FFFFFFF);
  static const Color white10  = Color(0x1AFFFFFF);

  static const Color cardBg     = Color(0x1FFFFFFF);
  static const Color cardBorder = Color(0x40FFFFFF);

  static const List<Color> welcomeGradient = [
    Color(0xFF0F0C29),
    Color(0xFF302B63),
    Color(0xFF24243E),
  ];

  static const List<Color> favoritesGradient = [
    Color(0xFF1A1240),
    Color(0xFF24243E),
    Color(0xFF1A1240),
  ];

  static const List<List<Color>> gradients = [
    [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
    [Color(0xFF1A0533), Color(0xFF3D1A6E), Color(0xFF1F0D3A)],
    [Color(0xFF0A1628), Color(0xFF1E3A5F), Color(0xFF0D2137)],
    [Color(0xFF1A0A00), Color(0xFF4A2000), Color(0xFF2A1200)],
    [Color(0xFF001A0A), Color(0xFF004A2A), Color(0xFF002A18)],
    [Color(0xFF1A001A), Color(0xFF4A004A), Color(0xFF2A002A)],
    [Color(0xFF001A1A), Color(0xFF004040), Color(0xFF002A2A)],
    [Color(0xFF0A0A1A), Color(0xFF1E1E4A), Color(0xFF0D0D2A)],
  ];
}
