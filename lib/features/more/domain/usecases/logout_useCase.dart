import 'package:together_test/features/more/domain/entities/logout_entity.dart';
import 'package:together_test/features/more/domain/repositories/logout_repository.dart';

class LogoutUseCase {
  final LogoutRepository repository;
  const LogoutUseCase(this.repository);
  Future<LogoutEntity> call({required String token}) {
    return repository.logout(token: token);
  }
}
