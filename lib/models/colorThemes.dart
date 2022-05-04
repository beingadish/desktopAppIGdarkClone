import 'dart:ui';
import 'package:hexcolor/hexcolor.dart' as hc;
import 'package:fluent_ui/fluent_ui.dart';

class DarkThemeScheme{
  final Color heading = hc.HexColor("#000000");
  final Color background = hc.HexColor("#617487");
  final Color paragraph = Colors.grey;
  final Color divider = Colors.white;
}

class LightThemeScheme{
  final Color heading = Colors.red;
  final Color paragraph = Colors.grey;
  final Color divider = Colors.white;
}