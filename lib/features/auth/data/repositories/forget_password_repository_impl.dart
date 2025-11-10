import 'package:flutter/material.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/forget_password_model.dart';
import 'package:together_test/features/auth/domain/entities/forget_password_entity.dart';
import 'package:together_test/features/auth/domain/repositories/forget_password_repository.dart';

class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  @override
  Future<ForgetPasswordEntity> forgetPassword(String email) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.forgetPasswordEndpoint,
        data: {'email': email},
      );
      debugPrint("✅ Forget Password Response: ${response.data}");
      final model = ForgetPasswordModel.fromJson(response.data);
      return ForgetPasswordEntity(
        success: model.success,
        message: model.message,
        messages: model.messages,
      );
    } catch (e) {
      debugPrint("❌ General Exception: $e");
      return ForgetPasswordEntity(
        success: false,
        message: "Unexpected error: ${e.toString()}",
      );
    }
  }
}
