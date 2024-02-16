import 'package:flutter/material.dart';
import 'package:gis_axiom_interview/core/theme/color_palette/color_palette.dart';
import 'package:gis_axiom_interview/core/theme/extensions/colors_extension.dart';
import 'package:gis_axiom_interview/core/theme/extensions/shadow_extension.dart';
import 'package:gis_axiom_interview/core/theme/extensions/space_extension.dart';
import 'package:gis_axiom_interview/core/theme/extensions/typography_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.light(),
  dialogTheme: const DialogTheme(
      backgroundColor: Colors.white, surfaceTintColor: Colors.white),
  extensions: <ThemeExtension<dynamic>>[
    AppColors(
      primary: Colors.blue,
      btnPrimary: AppColorPalette.navyBlue,
      txtInverse: Colors.white,
      txtSubtle: AppColorPalette.black_240,
      backgroundLight: AppColorPalette.backgroundLight,
      behindImage: AppColorPalette.grey,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: Colors.grey[800]!,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.black_240,
    ),
    AppBoxShadow(
      overlay: [
        const BoxShadow(
          blurRadius: 1,
          color: Color(0x1F091E42),
          blurStyle: BlurStyle.outer,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
        const BoxShadow(
          blurRadius: 8,
          color: Color(0x29091E42),
          blurStyle: BlurStyle.outer,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ],
    )
  ],
);

@riverpod
ThemeData appTheme(AppThemeRef ref) {
  return _lightTheme;
}
