import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';

abstract class IAppThemeColors {
  AppColors get colors;
  Color? addbuttonColor;
  Color? dividerColor;
  Color? appbarIconsColor;
  Color? addingPageShadow;
  Color? circleAvatarBackground;
  Color? disabledButtonColor;
  Color? slidableBackgroundblue;
  Color? slidableBackgroundred;
  Color? seperatorColor;
  Color? textColorHomeAppBar;
  Color? addButonTextColor;
}

class AppColors {
  final blue = Colors.blue[700];
  final orange = Colors.orange[800];
  final darkblue = const Color.fromARGB(255, 14, 200, 233);
  final green = const Color.fromARGB(164, 52, 207, 5);
  final greenshadow = Colors.greenAccent;
  final white = const Color.fromARGB(255, 209, 199, 199);
  final black = const Color.fromARGB(255, 5, 0, 0);
  final cloudBlue = const Color.fromARGB(255, 0, 160, 235);
  final red = const Color.fromARGB(255, 228, 29, 3);
  final amber = Colors.amber;
  final white38 = Colors.white38;
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
    addingPageShadow = colors.greenshadow;
    circleAvatarBackground = colors.white;
    disabledButtonColor = colors.black;
    slidableBackgroundblue = colors.cloudBlue;
    slidableBackgroundred = colors.red;
    seperatorColor = colors.amber;
    textColorHomeAppBar = colors.white38;
    addButonTextColor = colors.white38;
  }
  @override
  AppColors colors = AppColors();

  @override
  late final Color? addingPageShadow;

  @override
  late final Color? circleAvatarBackground;

  @override
  late final Color? disabledButtonColor;

  @override
  late final Color? slidableBackgroundblue;
  @override
  late final Color? slidableBackgroundred;

  @override
  Color? seperatorColor;

  @override
  Color? textColorHomeAppBar;

  @override
  Color? addButonTextColor;
}
