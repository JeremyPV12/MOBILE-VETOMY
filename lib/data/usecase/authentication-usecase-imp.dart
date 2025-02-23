import 'package:vetomymobile/data/source/vettomy.dart/auth-api.dart';
import 'package:vetomymobile/data/source/localstorage/auth-storage.dart';
import 'package:vetomymobile/domain/auth/models/login-response.dart';
import 'package:vetomymobile/domain/auth/models/user-profile.dart';
import 'package:vetomymobile/domain/auth/models/signup-request.dart';
import 'package:vetomymobile/domain/auth/models/login-request.dart';
import 'package:vetomymobile/domain/auth/usecase/authentication-useacase-main.dart';

class AuthenticationUsecaseImpl implements AuthenticationUsecase {
  final AuthApi _auth = AuthApi();
  final AuthStorage _storage = AuthStorage();

  @override
  Future<UserProfile?> isLogin() async {
    // buscar el tocal localmente
    String? tokenLocal = await _storage.getToken();
    // Validamos el token
    // si existe y es valido, retornamos el user profile
    UserProfile? profile = await _storage.getProfile();
    return profile;
  }

  @override
  Future<UserProfile> login(LoginRequest body) async {
    // llamar al servicio para inicioar sesion
    LoginResponse res = await _auth.login(body);
    // validar los datos de inicio de sesion
    print(res);
    // Guardar los datos de inicio de sesion
    await _storage.saveToken(res.token);
    await _storage.saveProfile(res.profile);

    return res.profile;
  }

  @override
  Future<void> logout() {
    return _storage.clearAll();
  }

  @override
  Future<void> signup(SignupRequest body) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
