import 'package:together_test/features/more/domain/entities/edit_profile_entity.dart';
import 'package:together_test/features/more/domain/repositories/edit_profile_repository.dart';

class EditProfileUseCase {
  final EditProfileRepository repository;
  EditProfileUseCase(this.repository);
  Future<EditProfileEntity> call({
    required String token,
    required String method,
    required String firstName,
    required String lastName,
    String? address,
    String? phone,
  }) {
    return repository.editProfile(
      token: token,
      method: method,
      firstName: firstName,
      lastName: lastName,
      address: address,
      phone: phone,
    );
  }
}
