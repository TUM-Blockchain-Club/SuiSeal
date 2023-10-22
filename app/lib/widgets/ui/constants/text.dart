import 'package:flutter/material.dart';
import 'constants.dart' as ui;

class Text {
  const Text._();

  static const TextStyle h1          = TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, color: ui.Colors.text);
  static const TextStyle h1secondary = TextStyle(fontSize: 32.0, fontWeight: FontWeight.w700, color: ui.Colors.textSecondary);
  static const TextStyle h2          = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: ui.Colors.text);
  static const TextStyle h2secondary = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: ui.Colors.textSecondary);
  static const TextStyle h3          = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: ui.Colors.text);
  static const TextStyle h3secondary = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: ui.Colors.textSecondary);

  static const TextStyle bodyStrong = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: ui.Colors.text);
  static const TextStyle bodyStrongSecondary = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: ui.Colors.textSecondary);
  static const TextStyle body = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: ui.Colors.text);
  static const TextStyle bodySecondary = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: ui.Colors.textSecondary);
}
