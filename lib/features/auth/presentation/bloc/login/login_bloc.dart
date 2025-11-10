import 'package:bloc/bloc.dart';
import 'package:together_test/features/auth/domain/useCases/login_useCase.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;
  LoginBloc(this.useCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginRequestEvent) {
        emit(LoginLoading());
        try {
          final result = await useCase.call(event.email, event.password);
          if (result.success == true) {
            emit(
              LoginSuccess(message: result.message, token: result.token ?? ''),
            );
          } else {
            emit(LoginError(message: result.message));
          }
        } catch (e) {
          emit(LoginError(message: 'An error occurred: ${e.toString()}'));
        }
      }
    });
  }
}
