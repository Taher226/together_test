import 'package:together_test/features/more/domain/entities/logout_entity.dart';

abstract class LogoutRepository {
  Future<LogoutEntity> logout({required String token});
}
