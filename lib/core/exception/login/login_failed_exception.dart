import 'package:gis_axiom_interview/core/exception/base_exception.dart';

class LoginFailedException extends BaseException {
  final String? errorMsg;
  LoginFailedException({this.errorMsg})
      : super(
            message: errorMsg ?? "Login Failed, an unknown exception occurred");
}
