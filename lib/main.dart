import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gis_axiom_interview/core/theme/theme.dart';
import 'package:gis_axiom_interview/core/widgets/error_page.dart';
import 'package:gis_axiom_interview/core/widgets/loading_page.dart';
import 'package:gis_axiom_interview/features/home/presentation/page/view_page.dart';
import 'package:gis_axiom_interview/features/login/data/repository/auth_repo.dart';
import 'package:gis_axiom_interview/features/login/presentation/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(appThemeProvider),
      home: authValidator(ref),
    );
  }

  Widget authValidator(WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) {
            if (data == null) {
              return const LoginPage();
            } else {
              return const ViewPage();
            }
          },
          error: (error, stackTrace) => const ErrorPage(),
          loading: () => const LoadingPage(),
        );
  }
}
