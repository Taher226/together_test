import 'package:together_test/features/auth/domain/entities/verify_email_entity.dart';

abstract class VerifyEmailRepository {
  Future<VerifyEmailEntity> verifyEmail({
    required String otp,
    required String email,
  });
}
