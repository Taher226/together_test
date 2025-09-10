import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/data/models/show_profile_model.dart';
import 'package:together_test/features/more/data/repositories/show_profile_repository.dart';

part 'show_profile_event.dart';
part 'show_profile_state.dart';

class ShowProfileBloc extends Bloc<ShowProfileEvent, ShowProfileState> {
  final ShowProfileRepository repository;
  ShowProfileBloc(this.repository) : super(ShowProfileInitial()) {
    on<ShowProfileRequestEvent>((event, emit) async {
      emit(ShowProfileLoading());
      try {
        final result = await repository.showProfile(event.token);
        emit(ShowProfileSuccess(result));
      } catch (e) {
        emit(ShowProfileFailure(e.toString()));
      }
    });
  }
}
