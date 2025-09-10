import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/edit_profile_model.dart';

class EditProfileRepository {
  Future<EditProfileModel> editProfile({
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
        return EditProfileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to Update profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Update Profile Error: ${e.toString()}');
    }
  }
}
