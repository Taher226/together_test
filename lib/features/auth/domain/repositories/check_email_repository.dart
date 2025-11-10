import 'package:together_test/features/auth/domain/entities/check_email_entity.dart';

abstract class CheckEmailRepository {
  Future<CheckEmailEntity> checkEmail(String email);
}
