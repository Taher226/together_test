import 'package:together_test/features/programs/domain/entities/program_details_entity.dart';
import 'package:together_test/features/programs/domain/repositories/program_details_repository.dart';

class ProgramDetailsUseCase {
  final ProgramDetailsRepository repository;
  const ProgramDetailsUseCase(this.repository);
  Future<ProgramDetailsEntity> call({required int id}) {
    return repository.getProgramDetails(id: id);
  }
}
