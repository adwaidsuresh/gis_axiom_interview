import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gis_axiom_interview/features/login/data/repository/auth_repo.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Something went wrong, check your internet connection and try again"),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () {
                ref.invalidate(authStateChangeProvider);
              },
              child: const Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
