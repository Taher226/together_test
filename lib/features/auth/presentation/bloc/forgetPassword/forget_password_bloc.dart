import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/domain/useCases/forget_password_useCase.dart';
import 'package:together_test/features/auth/presentation/bloc/forgetPassword/forget_password_state.dart';
part 'forget_password_event.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordUseCase useCase;
  ForgetPasswordBloc(this.useCase) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordRequestEvent>((event, emit) async {
      emit(ForgetPasswordLoading());
      final result = await useCase.call(event.email);
      if (result.success == true) {
        emit(ForgetPasswordSuccess(result.message ?? 'Success'));
      } else {
        if (result.messages != null && result.messages!.isNotEmpty) {
          final firstError = result.messages!.values.first.first;
          emit(ForgetPasswordError(firstError));
        } else {
          emit(ForgetPasswordError(result.message ?? "Failed to send OTP"));
        }
      }
    });
  }
}
