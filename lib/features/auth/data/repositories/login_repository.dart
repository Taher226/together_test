import 'package:flutter/material.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/login_model.dart';

class LoginRepository {
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/login',
        data: {"email": email, "password": password},
      );
      debugPrint("✅ Response Data: ${response.data}");
      return LoginModel.fromJson(response.data);
    } catch (e) {
      return LoginModel(
        success: false,
        message: "Something went wrong",
        messages: [e.toString()],
        data: null,
      );
    }
  }
}
