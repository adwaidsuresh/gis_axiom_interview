import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gis_axiom_interview/features/home/data/modelclass/model_Class.dart';

class Apiservice {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://kezel.co/api/'));

  Future<Restuarent?> getRestaurent() async {
    try {
      Response response = await dio.post('getAllDigitalMenu.php',
          data: FormData.fromMap({'restaurant': 'LeisureInnVKL'}));
      if (response.statusCode == 200) {
        log(response.data);
        Map<String, dynamic> jsonResponse = jsonDecode(response.data);
        return Restuarent.fromJson(jsonResponse);
      }
    } on DioException catch (e) {
      log('Error fetching data: $e');
    }
    return null;
  }
}
