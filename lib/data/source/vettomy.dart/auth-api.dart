import 'package:vetomymobile/domain/auth/models/login-request.dart';
import 'package:vetomymobile/domain/auth/models/login-response.dart';
import 'package:vetomymobile/domain/auth/models/signup-request.dart';
import 'package:vetomymobile/domain/auth/models/user-profile.dart';
import 'package:dio/dio.dart';

class AuthApi {
  Future<LoginResponse> login(LoginRequest body) async {
    final dio = Dio();

    Response response = await dio.post(
        "https://www.veterinariatomyhyope.somee.com/api/auth/authentication/login",
        data: body.toJson(),
        options: Options(contentType: "application/json"));

    if (response.statusCode != 200) {
      throw Exception("No se logeo correctamente");
    }
    return LoginResponse.fromJson(response.data);
  }

  Future<void> signup(SignupRequest body) {
    throw Exception("");
  }
}
