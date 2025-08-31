import 'package:bloc/bloc.dart';
import 'package:together_test/features/auth/data/repositories/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginRequestEvent) {
        emit(LoginLoading());
        try {
          final result = await repository.login(
            email: event.email,
            password: event.password,
          );
          if (result.success == true) {
            emit(
              LoginSuccess(
                message: result.message,
                token: result.data?.token ?? '',
              ),
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
