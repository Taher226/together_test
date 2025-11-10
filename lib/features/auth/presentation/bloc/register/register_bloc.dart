import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:together_test/features/auth/domain/useCases/register_useCase.dart';
import 'package:together_test/features/auth/presentation/bloc/register/register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase useCase;
  RegisterBloc(this.useCase) : super(RegisterInitial()) {
    on<RegisterSubmittedEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await useCase.call(
          event.email,
          event.firstName,
          event.lastName,
          event.password,
          event.passwordConfirmation,
          event.countryId,
          event.stateId,
          event.city,
          event.postalCode,
          event.address,
        );

        if (result.success == true) {
          emit(RegisterSuccess(message: result.message));
        } else {
          // Handle validation errors
          String errorMessage = result.message;

          // If there are specific validation messages, include them
          if (result.messages != null && result.messages!.isNotEmpty) {
            List<String> validationErrors = [];
            result.messages!.forEach((value) {
              validationErrors.addAll([value]);
            });
            if (validationErrors.isNotEmpty) {
              errorMessage = validationErrors.join('\n');
            }
          }

          emit(RegisterError(error: errorMessage));
        }
      } catch (e) {
        debugPrint("❌ Register Bloc Error: $e");
        String errorMessage = 'An unexpected error occurred';

        if (e.toString().contains('404')) {
          errorMessage =
              'Registration endpoint not found. Please contact support.';
        } else if (e.toString().contains('timeout')) {
          errorMessage =
              'Request timeout. Please check your internet connection and try again.';
        } else if (e.toString().contains('connection')) {
          errorMessage =
              'No internet connection. Please check your network and try again.';
        }

        emit(RegisterError(error: errorMessage));
      }
    });
  }
}
