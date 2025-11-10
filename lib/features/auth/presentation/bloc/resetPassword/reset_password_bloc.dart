import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/domain/entities/reset_password_entity.dart';
import 'package:together_test/features/auth/domain/useCases/reset_password_useCase.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase useCase;
  ResetPasswordBloc(this.useCase) : super(ResetPasswordInitial()) {
    on<ResetPasswordRequestEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        final result = await useCase.call(
          event.email,
          event.otp,
          event.password,
          event.passwordConfirmation,
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
