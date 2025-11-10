import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/entities/logout_entity.dart';
import 'package:together_test/features/more/domain/usecases/logout_useCase.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase useCase;
  LogoutBloc(this.useCase) : super(LogoutInitial()) {
    on<LogOutRequestEvent>((event, emit) async {
      emit(LogoutLoading());
      try {
        final result = await useCase.call(token: event.token);
        emit(LogoutSuccess(result));
      } catch (e) {
        emit(LogoutFailure(e.toString()));
      }
    });
  }
}
