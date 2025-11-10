import 'package:together_test/features/more/domain/entities/change_email_entity.dart';

abstract class ChangeEmailRepository {
  Future<ChangeEmailEntity> changeEmail({
    required String email,
    required String token,
  });
}
