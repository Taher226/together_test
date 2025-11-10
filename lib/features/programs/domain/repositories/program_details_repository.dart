import 'package:together_test/features/programs/domain/entities/program_details_entity.dart';

abstract class ProgramDetailsRepository {
  Future<ProgramDetailsEntity> getProgramDetails({required int id});
}
