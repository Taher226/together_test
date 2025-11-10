import 'package:together_test/features/auth/domain/entities/register_entity.dart';
import 'package:together_test/features/auth/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;
  RegisterUseCase(this.repository);
  Future<RegisterEntity> call(
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
  ) {
    return repository.register(
      firstName,
      lastName,
      email,
      password,
      passwordConfirmation,
      countryId,
      stateId,
      city,
      postalCode,
      address,
    );
  }
}
