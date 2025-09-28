import 'package:together_test/core/config/api_config.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/data/models/show_profile_model.dart';
import 'package:together_test/features/more/domain/entities/show_profile_entity.dart';
import 'package:together_test/features/more/domain/repositories/show_profile_repository.dart';

// class ShowProfileRepository {
//   Future<ShowProfileModel> showProfile(String token) async {
//     try {
//       final response = await DioHelper.getData(
//         url: ApiConfig.showProfileEndpoint,
//         token: token,
//       );
//       if (response.statusCode == 200) {
//         return ShowProfileModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to show profile: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Catching Profile Error: ${e.toString()}');
//     }
//   }
// }
class ShowProfileRepositoryImpl implements ShowProfileRepository {
  Future<ShowProfileEntity> showProfile(String token) async {
    try {
      final response = await DioHelper.getData(
        url: ApiConfig.showProfileEndpoint,
        token: token,
      );
      if (response.statusCode == 200) {
        final model = ShowProfileModel.fromJson(response.data);
        final data = model.data!;
        return ShowProfileEntity(
          id: data.id,
          firstName: data.firstName,
          lastName: data.lastName,
          email: data.email,
          photoUrl: data.photoUrl,
          photoInfo: data.photoInfo,
          phone: data.phone,
          countryCode: data.countryCode,
          address: data.address,
          countryId: data.countryId,
          stateId: data.stateId,
          city: data.city,
          postalCode: data.postalCode,
          isSocial: data.isSocial,
        );
      } else {
        throw Exception('Failed to show profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Catching Profile Error: ${e.toString()}');
    }
  }
}
