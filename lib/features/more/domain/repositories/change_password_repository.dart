import 'package:together_test/features/more/domain/entities/change_password_entity.dart';

abstract class ChangePasswordRepository {
  Future<ChangePasswordEntity> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    required String token,
  });
}
