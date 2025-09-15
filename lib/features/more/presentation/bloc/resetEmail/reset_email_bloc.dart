import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/data/repositories/reset_email_repository.dart';

part 'reset_email_event.dart';
part 'reset_email_state.dart';

class ResetEmailBloc extends Bloc<ResetEmailEvent, ResetEmailState> {
  final ResetEmailRepository repository;
  ResetEmailBloc(this.repository) : super(ResetEmailInitial()) {
    on<ResetEmailRequestEvent>((event, emit) async {
      emit(ResetEmailLoading());
      try {
        final result = await repository.resetEmail(
          token: event.token,
          email: event.email,
          password: event.password,
          otp: event.otp,
        );
        if (result.success) {
          emit(
            ResetEmailSuccess(result.message ?? "Email changed successfully"),
          );
        } else {
          final error = result.messages?.values.first.first ?? "Unknown error";
          emit(ResetEmailFailure(error));
        }
      } catch (e) {
        emit(ResetEmailFailure(e.toString()));
      }
    });
  }
}
