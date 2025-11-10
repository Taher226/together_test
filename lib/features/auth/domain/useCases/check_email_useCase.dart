import 'package:together_test/features/auth/domain/entities/check_email_entity.dart';
import 'package:together_test/features/auth/domain/repositories/check_email_repository.dart';

class CheckEmailUseCase {
  final CheckEmailRepository repository;
  CheckEmailUseCase(this.repository);

  Future<CheckEmailEntity> call(String email) {
    return repository.checkEmail(email);
  }
}
