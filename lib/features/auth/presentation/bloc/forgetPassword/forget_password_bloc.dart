import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/repositories/forget_password_repository.dart';
import 'package:together_test/features/auth/presentation/bloc/forgetPassword/forget_password_state.dart';
part 'forget_password_event.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordRepository repository;
  ForgetPasswordBloc(this.repository) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordRequestEvent>((event, emit) async {
      emit(ForgetPasswordLoading());
      final result = await repository.forgetPassword(email: event.email);
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
