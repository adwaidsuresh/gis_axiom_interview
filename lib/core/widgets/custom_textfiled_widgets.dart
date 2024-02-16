import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gis_axiom_interview/core/theme/theme_helper.dart';
// import 'package:sawara_interview/core/theme%20/theme_helper.dart';
// import 'package:sawara_solutions/core/theme%20/theme_helper.dart';

class CustomTextField extends ConsumerWidget {
  final String hintText;
  final String? headText;
  final Widget? prifixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.headText,
    this.prifixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        headText != null
            ? Padding(
                padding: EdgeInsets.only(bottom: spaces.space_100),
                child: Text(
                  headText!,
                  style: typography.h500,
                ),
              )
            : const SizedBox(),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          cursorColor: colors.txtSubtle,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: prifixIcon,
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: spaces.space_200),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spaces.space_125),
              borderSide: const BorderSide(width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
