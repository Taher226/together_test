import 'package:together_test/features/auth/domain/entities/reset_password_entity.dart';
import 'package:together_test/features/auth/domain/repositories/reset_password_repository.dart';

class ResetPasswordUseCase {
  final ResetPasswordRepository repository;
  ResetPasswordUseCase(this.repository);
  Future<ResetPasswordEntity> call(
    String email,
    int otp,
    String password,
    String passwordConfirmation,
  ) {
    return repository.resetPassword(
      email: email,
      otp: otp,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
