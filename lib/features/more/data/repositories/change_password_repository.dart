import 'package:dio/dio.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/change_password_model.dart';

class ChangePasswordRepository {
  Future<ChangePasswordModel> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    required String token,
  }) async {
    try {
      final response = await DioHelper.patchData(
        url: ApiConfig.changePasswordEndpoint,
        data: {
          'current_password': currentPassword,
          'password': newPassword,
          'password_confirmation': confirmPassword,
        },
        token: token,
      );
      if (response.statusCode == 200) {
        return ChangePasswordModel.fromJson(response.data);
      } else {
        throw Exception('Failed to Change Password: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return e.response?.data["messages"].values.first.first ??
          "Failed to change password";
    }
  }
}
