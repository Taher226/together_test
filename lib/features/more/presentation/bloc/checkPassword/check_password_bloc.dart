import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/data/models/check_password_model.dart';
import 'package:together_test/features/more/data/repositories/check_password_repository.dart';

part 'check_password_event.dart';
part 'check_password_state.dart';

class CheckPasswordBloc extends Bloc<CheckPasswordEvent, CheckPasswordState> {
  final CheckPasswordRepository repository;
  CheckPasswordBloc(this.repository) : super(CheckPasswordInitial()) {
    on<CheckPasswordRequestEvent>((event, emit) async {
      emit(CheckPasswordLoading());
      try {
        final result = await repository.checkPassword(
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
