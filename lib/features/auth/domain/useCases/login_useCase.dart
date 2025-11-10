import 'package:together_test/features/auth/domain/entities/login_entity.dart';
import 'package:together_test/features/auth/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);
  Future<LoginEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
