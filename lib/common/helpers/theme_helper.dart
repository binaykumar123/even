import 'dart:ui';

import 'package:even/common/helpers/functs.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(colorToInt(hexColor));
}

int colorToInt(String hexColor) {
  var _hexColor = hexColor ?? '';

  _hexColor = _hexColor.toUpperCase().replaceAll('#', '');

  if (isNullOrEmpty(_hexColor)) {
    _hexColor = '000000';
  }

  if (_hexColor.length == 6) {
    _hexColor = 'FF$_hexColor';
  }

  return int.parse(_hexColor, radix: 16);
}