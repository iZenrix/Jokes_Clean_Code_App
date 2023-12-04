import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:jokes_app/app/core/value/constant.dart';
import 'package:jokes_app/app/data/models/login/login_request_model.dart';
import 'package:jokes_app/app/data/models/login/login_response_model.dart';
import 'package:jokes_app/app/data/models/register/register_request_model.dart';
import 'package:jokes_app/app/data/models/register/register_response_model.dart';

class AuthProvider extends GetConnect {
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(Constant.loginUrl, model.toJson());

    try {
      if (response.statusCode == HttpStatus.ok) {
        return LoginResponseModel.fromJson(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    try {
      final response = await post(Constant.registerUrl, model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return RegisterResponseModel.fromJson(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
