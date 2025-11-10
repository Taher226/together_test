import 'package:together_test/features/home/domain/entities/home_programs_entity.dart';
import 'package:together_test/features/home/domain/repositories/home_programs_repository.dart';

class HomeProgramsUseCase {
  final HomeProgramsRepository repository;
  HomeProgramsUseCase(this.repository);
  Future<HomeProgramsEntity> call(int limit) {
    return repository.getHomePrograms(limit: limit);
  }
}
