import 'package:dio/dio.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/change_password_model.dart';
import 'package:together_test/features/more/domain/entities/change_password_entity.dart';
import 'package:together_test/features/more/domain/repositories/change_password_repository.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  @override
  Future<ChangePasswordEntity> changePassword({
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
        isRawData: true,
      );
      if (response.statusCode == 200) {
        final model = ChangePasswordModel.fromJson(response.data);
        return ChangePasswordEntity(
          success: model.success,
          message: model.message,
          messages: model.messages,
        );
      } else {
        throw Exception('Failed to Change Password: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return e.response?.data["messages"].values.first.first ??
          "Failed to change password";
    }
  }
}
