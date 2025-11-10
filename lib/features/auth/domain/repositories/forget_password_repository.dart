import 'package:together_test/features/auth/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordRepository {
  Future<ForgetPasswordEntity> forgetPassword(String email);
}
