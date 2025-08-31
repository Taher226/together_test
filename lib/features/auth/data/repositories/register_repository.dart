import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/register_model.dart';

class RegisterRepository {
  Future<RegisterModel> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String passwordConfirmation,
    int? countryId,
    int? stateId,
    String? city,
    String? postalCode,
    String? address,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: 'api/v1/users/client/auth/signup',
        data: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
          "password_confirmation": passwordConfirmation,
          "country_id": countryId,
          "state_id": stateId,
          "city": city,
          "postal_code": postalCode,
          "address": address,
        },
      );
      debugPrint("✅ Response Data: ${response.data}");
      return RegisterModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return RegisterModel.fromJson(e.response?.data);
      }
      rethrow;
    }
  }
}
