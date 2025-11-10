import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/usecases/change_email_useCase.dart';

part 'change_email_event.dart';
part 'change_email_state.dart';

class ChangeEmailBloc extends Bloc<ChangeEmailEvent, ChangeEmailState> {
  final ChangeEmailUseCase useCase;
  ChangeEmailBloc(this.useCase) : super(ChangeEmailInitial()) {
    on<ChangeEmailRequestEvent>((event, emit) async {
      emit(ChangeEmailLoading());
      try {
        final result = await useCase.call(
          email: event.email,
          token: event.token,
        );
        if (result.success) {
          emit(
            ChangeEmailSuccess(result.message ?? "Email changed successfully"),
          );
        } else {
          final error = result.messages?.values.first.first ?? "Unknown error";
          emit(ChangeEmailFailure(error));
        }
      } catch (e) {
        emit(ChangeEmailFailure(e.toString()));
      }
    });
  }
}
