import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:together_test/features/auth/domain/useCases/verify_otp_useCase.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpUseCase useCase;
  VerifyOtpBloc(this.useCase) : super(VerifyOtpInitial()) {
    on<VerifyOtpRequestEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      final result = await useCase.call(email: event.email, otp: event.otp);
      if (result.success == true) {
        emit(VerifyOtpSuccess(result));
      } else {
        emit(VerifyOtpError(result.message ?? "Verification failed"));
      }
    });
  }
}
