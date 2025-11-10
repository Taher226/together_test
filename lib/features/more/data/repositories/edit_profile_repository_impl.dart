import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/edit_profile_model.dart';
import 'package:together_test/features/more/domain/entities/edit_profile_entity.dart';
import 'package:together_test/features/more/domain/repositories/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  @override
  Future<EditProfileEntity> editProfile({
    required String token,
    required String method,
    required String firstName,
    required String lastName,
    String? address,
    String? phone,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.updateProfileEndpoint,
        data: {
          '_method': method,
          'first_name': firstName,
          'last_name': lastName,
          'address': address,
          'phone': phone,
          'country_code': '+20',
        },
        token: token,
      );
      if (response.statusCode == 200) {
        final model = EditProfileModel.fromJson(response.data);
        return EditProfileEntity(
          success: model.success,
          message: model.message,
          messages: model.messages,
        );
      } else {
        throw Exception('Failed to Update profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Update Profile Error: ${e.toString()}');
    }
  }
}
