import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/check_email_model.dart';
import 'package:together_test/features/auth/domain/entities/check_email_entity.dart';
import 'package:together_test/features/auth/domain/repositories/check_email_repository.dart';

class CheckEmailRepositoryImpl implements CheckEmailRepository {
  @override
  Future<CheckEmailEntity> checkEmail(String email) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/check-email',
        data: {'email': email},
      );
      if (response.data is Map<String, dynamic>) {
        final model = CheckEmailModel.fromJson(response.data);
        return CheckEmailEntity(
          success: model.success,
          message: model.message,
          messages: model.messages?.map((e) => e.toString()).toList(),
        );
      } else {
        throw Exception("Unexpected response format: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception('Failed to check email: ${e.toString()}');
    }
  }
}
