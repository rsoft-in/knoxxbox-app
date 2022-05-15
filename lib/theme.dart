import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const FlexScheme usedScheme = FlexScheme.redWine;

ThemeData flexTheme() {
  return FlexThemeData.light(
    scheme: usedScheme,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 10,
    appBarOpacity: 0.5,
    appBarStyle: FlexAppBarStyle.background,
    transparentStatusBar: true,
    subThemesData: const FlexSubThemesData(
      elevatedButtonRadius: 5.0,
      textButtonRadius: 5.0,
      outlinedButtonRadius: 5.0,
      cardRadius: 10.0,
      bottomNavigationBarOpacity: 0.5,
      useTextTheme: false,
      bottomSheetModalElevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData flexThemeDark() {
  return FlexThemeData.dark(
    scheme: usedScheme,
    surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    blendLevel: 20,
    appBarOpacity: 0.5,
    appBarStyle: FlexAppBarStyle.surface,
    transparentStatusBar: true,
    subThemesData: const FlexSubThemesData(
      elevatedButtonRadius: 5.0,
      textButtonRadius: 5.0,
      outlinedButtonRadius: 5.0,
      cardRadius: 10.0,
      bottomNavigationBarOpacity: 0.5,
      useTextTheme: false,
      bottomSheetModalElevation: 0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
