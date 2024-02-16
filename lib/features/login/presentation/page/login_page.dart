import 'package:flutter/material.dart';
import 'package:gis_axiom_interview/core/exception/login/login_failed_exception.dart';
import 'package:gis_axiom_interview/core/theme/theme_helper.dart';
import 'package:gis_axiom_interview/features/login/data/source/login_source.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login5.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Text(
              'Kezel',
              style: TextStyle(
                  fontSize: space.space_900 * 2,
                  color: colors.primary,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'FONT1'),
            ),
          ),
          Positioned(
            bottom: space.space_800 * 4,
            left: space.space_800,
            child: SizedBox(
              height: space.space_700,
              width: space.space_900 * 4,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(space.space_200),
                    ),
                    backgroundColor: colors.backgroundLight),
                onPressed: () async {
                  try {
                    Authentication.signInWithGoogle();
                  } on LoginFailedException catch (_) {
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/google.png'),
                    Text(
                      'Google Login',
                      style: typography.h700,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: space.space_900,
            left: space.space_900 * 1.5,
            child: Text(
              'Discover our Menu',
              style: TextStyle(
                  fontSize: space.space_300,
                  color: colors.backgroundLight,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'FONT1'),
            ),
          ),
        ],
      ),
    );
  }
}
