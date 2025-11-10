import 'package:together_test/features/more/domain/entities/change_password_entity.dart';
import 'package:together_test/features/more/domain/repositories/change_password_repository.dart';

class ChangePasswordUseCase {
  final ChangePasswordRepository repository;
  ChangePasswordUseCase(this.repository);
  Future<ChangePasswordEntity> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) {
    return repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
      token: token,
    );
  }
}
