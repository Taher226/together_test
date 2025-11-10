import 'package:together_test/features/more/domain/entities/reset_email_entity.dart';
import 'package:together_test/features/more/domain/repositories/reset_email_repository.dart';

class ResetEmailUseCase {
  final ResetEmailRepository repository;
  ResetEmailUseCase(this.repository);
  Future<ResetEmailEntity> call({
    required String token,
    required String email,
    required String password,
    required int otp,
  }) {
    return repository.resetEmail(
      token: token,
      email: email,
      password: password,
      otp: otp,
    );
  }
}
