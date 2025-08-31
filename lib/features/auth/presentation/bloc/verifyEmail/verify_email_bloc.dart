import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/models/verify_email_model.dart';
import 'package:together_test/features/auth/data/repositories/verify_email_repository.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyEmailRepository repository;
  VerifyEmailBloc(this.repository) : super(VerifyEmailInitial()) {
    on<VerifyEmailRequestEvent>((event, emit) async {
      emit(VerifyEmailLoading());
      try {
        final response = await repository.verifyEmail(
          email: event.email,
          otp: event.otp,
        );
        if (response.success == true) {
          emit(VerifyEmailSuccess(response));
        } else {
          emit(
            VerifyEmailError(
              response.messages?['email']?.first ?? "Unknown error",
            ),
          );
        }
      } catch (e) {
        emit(VerifyEmailError(e.toString()));
      }
    });
  }
}
