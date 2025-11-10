import 'package:together_test/features/auth/domain/entities/reset_password_entity.dart';

abstract class ResetPasswordRepository {
  Future<ResetPasswordEntity> resetPassword({
    required String email,
    required int otp,
    required String password,
    required String passwordConfirmation,
  });
}
