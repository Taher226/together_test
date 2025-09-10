import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/data/models/verify_otp_model.dart';
import 'package:together_test/features/auth/data/repositories/verify_otp_repository.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpRepository repository;
  VerifyOtpBloc(this.repository) : super(VerifyOtpInitial()) {
    on<VerifyOtpRequestEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      final result = await repository.verifyOtp(
        email: event.email,
        otp: event.otp,
      );
      if (result.success == true) {
        emit(VerifyOtpSuccess(result));
      } else {
        emit(VerifyOtpError(result.message ?? "Verification failed"));
      }
    });
  }
}
