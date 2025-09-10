import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/models/reset_password_model.dart';
import 'package:together_test/features/auth/data/repositories/reset_password_repository.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordRepository repository;
  ResetPasswordBloc(this.repository) : super(ResetPasswordInitial()) {
    on<ResetPasswordRequestEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final result = await repository.resetPassword(
          email: event.email,
          otp: event.otp,
          password: event.password,
          passwordConfirmation: event.passwordConfirmation,
        );
        if (result.success == true) {
          emit(ResetPasswordSuccess(result));
        } else {
          emit(
            ResetPasswordError(result.message ?? "Failed to change password"),
          );
        }
      } catch (e) {
        emit(ResetPasswordError("Unexpected error: ${e.toString()}"));
      }
    });
  }
}
