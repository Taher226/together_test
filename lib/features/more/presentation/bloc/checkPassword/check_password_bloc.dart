import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/entities/check_password_entity.dart';
import 'package:together_test/features/more/domain/usecases/check_password_useCase.dart';

part 'check_password_event.dart';
part 'check_password_state.dart';

class CheckPasswordBloc extends Bloc<CheckPasswordEvent, CheckPasswordState> {
  final CheckPasswordUseCase useCase;
  CheckPasswordBloc(this.useCase) : super(CheckPasswordInitial()) {
    on<CheckPasswordRequestEvent>((event, emit) async {
      emit(CheckPasswordLoading());
      try {
        final result = await useCase.call(
          token: event.token,
          password: event.password,
        );
        if (result.success) {
          emit(CheckPasswordSuccess(result));
        } else {
          final error = result.message ?? "Unknown error";
          emit(CheckPasswordFailure(error));
        }
      } catch (e) {
        emit(CheckPasswordFailure(e.toString()));
      }
    });
  }
}
