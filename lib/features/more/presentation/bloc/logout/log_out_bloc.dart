import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/data/models/logout_model.dart';
import 'package:together_test/features/more/data/repositories/logout_repository.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutRepository repository;
  LogoutBloc(this.repository) : super(LogoutInitial()) {
    on<LogOutRequestEvent>((event, emit) async {
      emit(LogoutLoading());
      try {
        final result = await repository.logout(event.token);
        emit(LogoutSuccess(result));
      } catch (e) {
        emit(LogoutFailure(e.toString()));
      }
    });
  }
}
