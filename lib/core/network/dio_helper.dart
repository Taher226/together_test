import 'package:dio/dio.dart';
import 'package:together_test/core/config/api_config.dart';

class DioHelper {
  static late Dio dio;
  static init(String? domainUrl) {
    String base = (domainUrl ?? ApiConfig.baseUrl);
    if (!base.endsWith('/')) {
      base = '$base/';
    }
    dio = Dio(
      BaseOptions(
        baseUrl: base,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: ApiConfig.connectionTimeout),
        receiveTimeout: Duration(seconds: ApiConfig.receiveTimeout),
        headers: ApiConfig.defaultHeaders,
      ),
    );

    // Add interceptors for better logging
    if (ApiConfig.debugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => print('🌐 Dio Log: $obj'),
        ),
      );
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers['Authorization'] =
        token != null ? 'Bearer $token' : null;
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers['Authorization'] =
        token != null ? 'Bearer $token' : null;

    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: query,
        options: Options(
          validateStatus: (status) {
            // Allow all status codes to be processed
            return status != null && status < 600;
          },
        ),
      );

      // Log the response for debugging
      ApiConfig.logApiResponse(url, response.statusCode ?? 0, response.data);

      return response;
    } catch (e) {
      ApiConfig.logApiError(url, e.toString());
      rethrow;
    }
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers['Authorization'] =
        token != null ? 'Bearer $token' : null;
    return await dio.delete(url, data: data);
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    bool? isRawData,
  }) async {
    dio.options.headers['Authorization'] =
        token != null ? 'Bearer $token' : null;

    return await dio.patch(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status != null && status < 600;
        },
        contentType:
            isRawData == true ? 'application/json' : 'multipart/form-data',
      ),
    );
  }
}
