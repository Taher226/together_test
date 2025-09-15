import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/change_email_model.dart';

class ChangeEmailRepository {
  Future<ChangeEmailModel> changeEmail({
    required String email,
    required String token,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.changeEmailEndpoint2,
        data: {'email': email},
        token: token,
      );
      return ChangeEmailModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to change email: $e");
    }
  }
}
