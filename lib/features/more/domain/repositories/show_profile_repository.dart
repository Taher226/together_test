import 'package:together_test/features/more/domain/entities/show_profile_entity.dart';

abstract class ShowProfileRepository {
  Future<ShowProfileEntity> showProfile(String token);
}
