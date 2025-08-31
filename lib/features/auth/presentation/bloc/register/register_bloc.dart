import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/repositories/register_repository.dart';
import 'package:together_test/features/auth/presentation/bloc/register/register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository repository;
  RegisterBloc(this.repository) : super(RegisterInitial()) {
    on<RegisterSubmittedEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await repository.register(
          email: event.email,
          firstName: event.firstName,
          lastName: event.lastName,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
          countryId: event.countryId,
          stateId: event.stateId,
          city: event.city,
          postalCode: event.postalCode,
          address: event.address,
        );
        if (result.success == true) {
          emit(
            RegisterSuccess(
              message: result.message ?? 'Registration successful.',
            ),
          );
        } else {
          emit(RegisterError(error: result.message ?? 'Registration failed.'));
        }
      } catch (e) {
        emit(RegisterError(error: 'An error occurred: ${e.toString()}'));
      }
    });
  }
}
