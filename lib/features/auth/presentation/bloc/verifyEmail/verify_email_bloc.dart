import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/domain/entities/verify_email_entity.dart';
import 'package:together_test/features/auth/domain/useCases/verify_email_useCase.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyEmailUseCase useCase;
  VerifyEmailBloc(this.useCase) : super(VerifyEmailInitial()) {
    on<VerifyEmailRequestEvent>((event, emit) async {
      emit(VerifyEmailLoading());
      try {
        final result = await useCase.call(email: event.email, otp: event.otp);
        if (result.success == true) {
          emit(VerifyEmailSuccess(result));
        } else {
          emit(
            VerifyEmailError(
              result.messages?['email']?.first ?? "Unknown error",
            ),
          );
        }
      } catch (e) {
        emit(VerifyEmailError(e.toString()));
      }
    });
  }
}
