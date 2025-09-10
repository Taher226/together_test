import 'package:flutter/material.dart';
import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/forget_password_model.dart';

class ForgetPasswordRepository {
  Future<ForgetPasswordModel> forgetPassword({required String email}) async {
    try {
      final response = await DioHelper.postData(
        url: ApiConfig.forgetPasswordEndpoint,
        data: {'email': email},
      );
      debugPrint("✅ Forget Password Response: ${response.data}");
      return ForgetPasswordModel.fromJson(response.data);
    } catch (e) {
      debugPrint("❌ General Exception: $e");
      return ForgetPasswordModel(
        success: false,
        message: "Unexpected error: ${e.toString()}",
      );
    }
  }
}
