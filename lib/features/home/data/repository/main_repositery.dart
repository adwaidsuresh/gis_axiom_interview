import 'package:gis_axiom_interview/features/home/data/modelclass/model_Class.dart';
import 'package:gis_axiom_interview/features/home/data/source/home_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final apiserviceProvider = Provider<Apiservice>((ref) {
  return Apiservice();
});

final getpostProvider = FutureProvider<Restuarent?>((ref) async {
  return ref.watch(apiserviceProvider).getRestaurent();
});
