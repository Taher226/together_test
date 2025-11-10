import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/change_email_model.dart';
import 'package:together_test/features/more/domain/entities/change_email_entity.dart';
import 'package:together_test/features/more/domain/repositories/change_email_repository.dart';

class ChangeEmailRepositoryImpl implements ChangeEmailRepository {
  @override
  Future<ChangeEmailEntity> changeEmail({
    required String email,
    required String token,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.changeEmailEndpoint2,
        data: {'email': email},
        token: token,
      );
      final model = ChangeEmailModel.fromJson(response.data);
      return ChangeEmailEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } catch (e) {
      throw Exception("Failed to change email: $e");
    }
  }
}
