import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
          // Handle validation errors
          String errorMessage = result.message ?? 'Registration failed.';
          
          // If there are specific validation messages, include them
          if (result.messages != null && result.messages!.isNotEmpty) {
            List<String> validationErrors = [];
            result.messages!.forEach((key, value) {
              validationErrors.addAll(value);
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
          errorMessage = 'Registration endpoint not found. Please contact support.';
        } else if (e.toString().contains('timeout')) {
          errorMessage = 'Request timeout. Please check your internet connection and try again.';
        } else if (e.toString().contains('connection')) {
          errorMessage = 'No internet connection. Please check your network and try again.';
        }
        
        emit(RegisterError(error: errorMessage));
      }
    });
  }
}
