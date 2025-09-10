import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import '../models/countries_model.dart';

class CountriesRepository {
  Future<CountriesModel> getCountries() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.getCountriesEndpoint,
      );
      ApiConfig.logApiResponse(
        ApiConfig.getCountriesEndpoint,
        response.statusCode ?? 0,
        response.data,
      );

      if (response.statusCode == 200) {
        return CountriesModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load countries: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching countries: $e");
    }
  }
}
