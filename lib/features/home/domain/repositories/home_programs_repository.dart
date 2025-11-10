import 'package:together_test/features/home/domain/entities/home_programs_entity.dart';

abstract class HomeProgramsRepository {
  Future<HomeProgramsEntity> getHomePrograms({int limit = 5});
}
