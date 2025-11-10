import 'package:together_test/features/more/domain/entities/reset_email_entity.dart';

abstract class ResetEmailRepository {
  Future<ResetEmailEntity> resetEmail({
    required String token,
    required String email,
    required String password,
    required int otp,
  });
}
