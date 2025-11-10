import 'package:together_test/features/more/domain/entities/change_email_entity.dart';
import 'package:together_test/features/more/domain/repositories/change_email_repository.dart';

class ChangeEmailUseCase {
  final ChangeEmailRepository repository;
  const ChangeEmailUseCase(this.repository);
  Future<ChangeEmailEntity> call({
    required String email,
    required String token,
  }) {
    return repository.changeEmail(email: email, token: token);
  }
}
