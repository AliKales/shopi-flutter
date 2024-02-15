import 'dart:io';

import 'package:caroby/caroby.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class CustomTheme {
  final bool isDark;
  final BuildContext context;

  CustomTheme(this.context, this.isDark);

  ThemeData theme() {
    final cS = _getColorScheme;

    if (!kIsWeb && Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: cS.background,
          systemNavigationBarDividerColor: cS.background,
          systemNavigationBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
        ),
      );
    }

    return ThemeData(
      useMaterial3: true,
      fontFamily: "Roboto",
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      colorScheme: cS,
      navigationRailTheme: NavigationRailThemeData(
        indicatorColor: cS.primary,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: context.textTheme.headlineSmall!.copyWith(
          color: blackWhite(!isDark),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color blackWhite(bool isBlack) {
    if (isBlack) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  ColorScheme get _getColorScheme {
    if (isDark) {
      return const ColorScheme.dark(
        background: Color(0xFF212124),
        onSecondary: Color(0xFF212124),
        onError: Color(0xFF212124),
        surface: Color(0xFF212124),
      );
    }

    return const ColorScheme.light(
      primary: Color(0xffff9900),
    );
  }
}
