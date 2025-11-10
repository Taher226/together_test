import 'package:flutter/material.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/login_model.dart';
import 'package:together_test/features/auth/domain/entities/login_entity.dart';
import 'package:together_test/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginEntity> login(String email, String password) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/login',
        data: {"email": email, "password": password},
      );
      debugPrint("✅ Response Data: ${response.data}");
      final model = LoginModel.fromJson(response.data);
      return LoginEntity(
        success: model.success,
        message: model.message,
        messages: model.messages?.map((e) => e.toString()).toList(),
        token: model.data?.token,
        photoUrl: model.data?.photoUrl,
        lang: model.data?.lang,
      );
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }
}
