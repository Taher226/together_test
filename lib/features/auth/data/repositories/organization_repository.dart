import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/models/organization_details_model.dart';
import 'package:together_test/features/auth/data/models/organizations_model.dart';

class OrganizationRepository {
  Future<List<OrganizationsModel>> getOrganizations() async {
    try {
      final response = await DioHelper.getData(
        url: 'api/central/v1/tenants/client/list',
      );
      if (response.data is Map<String, dynamic> &&
          response.data['data'] is List) {
        final List<OrganizationsModel> organizations =
            (response.data['data'] as List)
                .map((e) => OrganizationsModel.fromJson(e))
                .toList();
        return organizations;
      } else {
        print("Unexpected response format: ${response.data}");
        return [];
      }
    } catch (e) {
      print('Error: $e');

      throw Exception('Failed to fetch organizations: $e');
    }
  }

  Future<OrganizationDetailsModel> getOrganizationDetails(String id) async {
    try {
      final response = await DioHelper.getData(
        url: 'api/central/v1/tenants/client/show/$id',
      );
      if (response.data is Map<String, dynamic> &&
          response.data['data'] is Map<String, dynamic>) {
        return OrganizationDetailsModel.fromJson(response.data['data']);
      } else {
        throw Exception("Unexpected response format: ${response.data}");
      }
    } catch (e) {
      print('Error in getOrganizationDetails: $e');

      throw Exception('Failed to fetch organization details: $e');
    }
  }
}
