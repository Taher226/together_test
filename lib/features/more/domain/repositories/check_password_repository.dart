import 'package:together_test/features/more/domain/entities/check_password_entity.dart';

abstract class CheckPasswordRepository {
  Future<CheckPasswordEntity> checkPassword({
    required String password,
    required String token,
  });
}
