import 'package:flutter/material.dart';

import 'color_theme.dart';

class TextThemes {

  static var main_text = TextStyle(
      fontWeight: FontWeight.normal ,
      fontSize: 24 ,
      color: ColorPalette.black,
      letterSpacing: 1.5

  );
  static var search_text = TextStyle(
      fontWeight: FontWeight.normal ,
      fontSize: 12 ,
      color: ColorPalette.main_color,
      letterSpacing: 0.5

  );
}