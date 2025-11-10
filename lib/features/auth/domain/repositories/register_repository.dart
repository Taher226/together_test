import 'package:together_test/features/auth/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  Future<RegisterEntity> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
    int? countryId,
    int? stateId,
    String? city,
    String? postalCode,
    String? address,
  );
}
