import 'package:flutter/material.dart';

Color colorFromHex(String color) => fromHex(color);

String toColorHex(Color? color) => color != null ? toHex(color) : '';

/// String is in the format "aabbcc" or "ffaabbcc"
/// with an optional leading "#".
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String toHex(Color color, {bool leadingHashSign = true}) =>
    '${leadingHashSign ? '#' : ''}'
    '${color.alpha.toRadixString(16).padLeft(2, '0')}'
    '${color.red.toRadixString(16).padLeft(2, '0')}'
    '${color.green.toRadixString(16).padLeft(2, '0')}'
    '${color.blue.toRadixString(16).padLeft(2, '0')}';
