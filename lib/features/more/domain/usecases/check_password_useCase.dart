import 'package:together_test/features/more/domain/entities/check_password_entity.dart';
import 'package:together_test/features/more/domain/repositories/check_password_repository.dart';

class CheckPasswordUseCase {
  final CheckPasswordRepository repository;
  const CheckPasswordUseCase(this.repository);
  Future<CheckPasswordEntity> call({
    required String token,
    required String password,
  }) {
    return repository.checkPassword(token: token, password: password);
  }
}
