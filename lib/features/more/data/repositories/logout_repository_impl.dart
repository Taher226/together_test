import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/logout_model.dart';
import 'package:together_test/features/more/domain/entities/logout_entity.dart';
import 'package:together_test/features/more/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  @override
  Future<LogoutEntity> logout({required String token}) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.logoutEndpoint,
        token: token,
        data: null,
      );
      if (response.statusCode == 200) {
        final model = LogoutModel.fromJson(response.data);
        return LogoutEntity(success: model.success, message: model.message);
      } else {
        throw Exception('Failed to logout: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Error: ${e.toString()}');
    }
  }
}
