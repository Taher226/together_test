import 'package:together_test/features/programs/domain/entities/programs_list_entity.dart';
import 'package:together_test/features/programs/domain/repositories/programs_list_repository.dart';

class ProgramsListUseCase {
  final ProgramsListRepository repository;
  const ProgramsListUseCase(this.repository);
  Future<ProgramsListEntity> call() {
    return repository.getProgramsList();
  }
}
