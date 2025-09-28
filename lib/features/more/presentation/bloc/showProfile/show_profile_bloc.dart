import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/entities/show_profile_entity.dart';
import 'package:together_test/features/more/domain/usecases/show_profile_usecase.dart';
part 'show_profile_event.dart';
part 'show_profile_state.dart';

class ShowProfileBloc extends Bloc<ShowProfileEvent, ShowProfileState> {
  final ShowProfileUseCase useCase;
  ShowProfileBloc(this.useCase) : super(ShowProfileInitial()) {
    on<ShowProfileRequestEvent>((event, emit) async {
      emit(ShowProfileLoading());
      try {
        final result = await useCase.call(event.token);
        emit(ShowProfileSuccess(result));
      } catch (e) {
        emit(ShowProfileFailure(e.toString()));
      }
    });
  }
}
