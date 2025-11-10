import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/usecases/change_password_useCase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase useCase;
  ChangePasswordBloc(this.useCase) : super(ChangePasswordInitial()) {
    on<ChangePasswordRequestEvent>((event, emit) async {
      emit(ChangePasswordLoading());
      try {
        final result = await useCase.call(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
          token: event.token,
        );
        if (result.success) {
          emit(
            ChangePasswordSuccess(
              result.message ?? "Password changed successfully",
            ),
          );
        } else {
          final error = result.messages?.values.first.first ?? "Unknown error";
          emit(ChangePasswordFailure(error));
        }
      } catch (e) {
        emit(ChangePasswordFailure(e.toString()));
      }
    });
  }
}
