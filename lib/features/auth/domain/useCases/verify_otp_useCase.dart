import 'package:together_test/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:together_test/features/auth/domain/repositories/verify_otp_repository.dart';

class VerifyOtpUseCase {
  final VerifyOtpRepository repository;
  const VerifyOtpUseCase(this.repository);
  Future<VerifyOtpEntity> call({required String email, required int otp}) {
    return repository.verifyOtp(email, otp);
  }
}
