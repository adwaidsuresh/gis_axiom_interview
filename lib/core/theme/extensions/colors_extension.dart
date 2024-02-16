import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color btnPrimary;
  final Color txtInverse;
  final Color txtSubtle;
  final Color backgroundLight;
  final Color behindImage;

  AppColors({
    required this.primary,
    required this.btnPrimary,
    required this.txtInverse,
    required this.txtSubtle,
    required this.backgroundLight,
    required this.behindImage,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? btnPrimary,
    Color? txtInverse,
    Color? txtSubtle,
    Color? backgroundLight,
    Color? behindImage,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      btnPrimary: btnPrimary ?? this.btnPrimary,
      txtInverse: txtInverse ?? this.txtInverse,
      txtSubtle: txtSubtle ?? this.txtSubtle,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      behindImage: behindImage ?? this.behindImage,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      btnPrimary: Color.lerp(btnPrimary, other.btnPrimary, t)!,
      txtInverse: Color.lerp(txtInverse, other.txtInverse, t)!,
      txtSubtle: Color.lerp(txtSubtle, other.txtSubtle, t)!,
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
      behindImage: Color.lerp(behindImage, other.behindImage, t)!,
    );

    // primary: Color.lerp(primary, other.primary, t)!,
    // btnPrimary: Color.lerp(btnPrimary, other.btnPrimary, t)!,
    // txtInverse: Color.lerp(txtInverse, other.txtInverse, t)!,
    // imgBack: Color.lerp(imgBack, other.imgBack, t)!,
    // txtSubtle: Color.lerp(txtSubtle, other.txtSubtle, t)!,
    // backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
    // container: Color.lerp(container, other.container, t)!);
  }
}
