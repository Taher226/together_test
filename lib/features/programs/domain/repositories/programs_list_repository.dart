import 'package:together_test/features/programs/domain/entities/programs_list_entity.dart';

abstract class ProgramsListRepository {
  Future<ProgramsListEntity> getProgramsList();
}
