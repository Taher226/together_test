import 'package:together_test/features/auth/domain/entities/verify_otp_entity.dart';

abstract class VerifyOtpRepository {
  Future<VerifyOtpEntity> verifyOtp(String email, int otp);
}
