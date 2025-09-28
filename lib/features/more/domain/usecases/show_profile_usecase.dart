import 'package:together_test/features/more/domain/entities/show_profile_entity.dart';
import 'package:together_test/features/more/domain/repositories/show_profile_repository.dart';

class ShowProfileUseCase {
  final ShowProfileRepository repository;
  ShowProfileUseCase(this.repository);

  Future<ShowProfileEntity> call(String token) {
    return repository.showProfile(token);
  }
}
