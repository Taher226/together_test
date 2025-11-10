import 'package:together_test/features/auth/domain/entities/verify_email_entity.dart';
import 'package:together_test/features/auth/domain/repositories/verify_email_repository.dart';

class VerifyEmailUseCase {
  final VerifyEmailRepository repository;
  VerifyEmailUseCase(this.repository);
  Future<VerifyEmailEntity> call({required String otp, required String email}) {
    return repository.verifyEmail(otp: otp, email: email);
  }
}
