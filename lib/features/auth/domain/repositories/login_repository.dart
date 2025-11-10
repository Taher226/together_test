import 'package:together_test/features/auth/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String email, String password);
}
