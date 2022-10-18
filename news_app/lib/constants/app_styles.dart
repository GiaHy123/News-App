import 'package:flutter/material.dart';

class FontFamily {
  static const roboto = "Roboto";
}

class AppStyles {
  static TextStyle medium = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle regular = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bold = const TextStyle(
    fontFamily: FontFamily.roboto,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}