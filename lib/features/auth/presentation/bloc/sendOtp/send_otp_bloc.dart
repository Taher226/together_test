import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/features/auth/data/repositories/send_otp_repository.dart';
import 'send_otp_event.dart';
import 'send_otp_state.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final SendOtpRepository repository;

  SendOtpBloc(this.repository) : super(SendOtpInitial()) {
    on<SendOtpSubmittedEvent>((event, emit) async {
      emit(SendOtpLoading());
      try {
        final response = await repository.sendOtp(email: event.email);
        if (response.success) {
          emit(SendOtpSuccess(response));
        } else {
          emit(
            SendOtpError(response.messages?['email']?.first ?? "Unknown error"),
          );
        }
      } catch (e) {
        emit(SendOtpError(e.toString()));
      }
    });
  }
}
