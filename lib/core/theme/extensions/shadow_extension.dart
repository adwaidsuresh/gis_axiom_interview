import 'package:flutter/material.dart';

class AppBoxShadow extends ThemeExtension<AppBoxShadow> {
  final List<BoxShadow> overlay;

  AppBoxShadow({required this.overlay});

  @override
  ThemeExtension<AppBoxShadow> copyWith({List<BoxShadow>? overlay}) {
    return AppBoxShadow(overlay: overlay ?? this.overlay);
  }

  @override
  ThemeExtension<AppBoxShadow> lerp(
      covariant ThemeExtension<AppBoxShadow>? other, double t) {
    if (other is! AppBoxShadow) {
      return this;
    }
    List<BoxShadow> lerpedList = [];
    for (int i = 0; i < overlay.length; i++) {
      lerpedList.add(BoxShadow.lerp(overlay[i], other.overlay[i], t)!);
    }
    return AppBoxShadow(overlay: lerpedList);
  }
}
