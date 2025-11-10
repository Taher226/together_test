import 'package:together_test/features/auth/domain/entities/forget_password_entity.dart';
import 'package:together_test/features/auth/domain/repositories/forget_password_repository.dart';

class ForgetPasswordUseCase {
  final ForgetPasswordRepository repository;
  ForgetPasswordUseCase(this.repository);
  Future<ForgetPasswordEntity> call(String email) {
    return repository.forgetPassword(email);
  }
}
