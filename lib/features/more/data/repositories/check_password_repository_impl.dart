import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/check_password_model.dart';
import 'package:together_test/features/more/domain/entities/check_password_entity.dart';
import 'package:together_test/features/more/domain/repositories/check_password_repository.dart';

class CheckPasswordRepositoryImpl implements CheckPasswordRepository {
  @override
  Future<CheckPasswordEntity> checkPassword({
    required String token,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.changeEmailEndpoint1,
        data: {'password': password},
        token: token,
      );
      final model = CheckPasswordModel.fromJson(response.data);
      return CheckPasswordEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } catch (e) {
      throw Exception("Failed to check password: $e");
    }
  }
}
