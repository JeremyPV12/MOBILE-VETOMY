import 'package:vetomymobile/domain/auth/models/login-request.dart';
import 'package:vetomymobile/domain/auth/models/signup-request.dart';
import 'package:vetomymobile/domain/auth/models/user-profile.dart';
import 'package:vetomymobile/domain/auth/models/user.dart';

abstract class AuthenticationUsecase {
  Future<void> signup(SignupRequest body);
  Future<UserProfile> login(LoginRequest body);
  Future<void> logout();
  Future<UserProfile?> isLogin();
}
