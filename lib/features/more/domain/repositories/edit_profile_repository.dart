import 'package:together_test/features/more/domain/entities/edit_profile_entity.dart';

abstract class EditProfileRepository {
  Future<EditProfileEntity> editProfile({
    required String token,
    required String method,
    required String firstName,
    required String lastName,
    String? address,
    String? phone,
  });
}
