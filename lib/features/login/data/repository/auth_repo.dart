import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gis_axiom_interview/features/login/data/source/login_source.dart';

final authServiceProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final authStateChangeProvider = StreamProvider<User?>((ref) {
  return ref.read(authServiceProvider).authStatechange();
});
