import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/auth/domain/entities/check_email_entity.dart';
import 'package:together_test/features/auth/domain/useCases/check_email_useCase.dart';

part 'check_email_event.dart';
part 'check_email_state.dart';

class CheckEmailBloc extends Bloc<CheckEmailEvent, CheckEmailState> {
  final CheckEmailUseCase useCase;
  CheckEmailBloc(this.useCase) : super(CheckEmailInitial()) {
    on<CheckEmailRequestEvent>((event, emit) async {
      emit(CheckEmailLoading());
      try {
        final result = await useCase.call(event.email);
        emit(CheckEmailSuccess(result));
      } catch (e) {
        emit(CheckEmailError(e.toString()));
      }
    });
  }
}
