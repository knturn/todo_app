import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';

abstract class IAppThemeColors {
  AppColors get colors;
  Color? addbuttonColor;
  Color? dividerColor;
  Color? appbarIconsColor;
}

class AppColors {
  final blue = Colors.blue[700];
  final orange = Colors.orange[800];
  final darkblue = const Color.fromARGB(255, 14, 200, 233);
  final green = const Color.fromARGB(164, 52, 207, 5);
}

class LightColorTheme implements IAppThemeColors {
  @override
  late final Color? addbuttonColor;

  @override
  late final Color? appbarIconsColor;

  @override
  late final Color? dividerColor;
  LightColorTheme() {
    addbuttonColor = colors.green;
    appbarIconsColor = colors.orange;
    dividerColor = colors.darkblue;
  }
  @override
  AppColors colors = AppColors();
}
