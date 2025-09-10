import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/home/data/models/home_programs_model.dart';
import 'package:together_test/features/home/data/repositories/home_programs_repository.dart';

part 'home_programs_event.dart';
part 'home_programs_state.dart';

class HomeProgramsBloc extends Bloc<HomeProgramsEvent, HomeProgramsState> {
  final HomeProgramsRepository repository;
  HomeProgramsBloc(this.repository) : super(HomeProgramsInitial()) {
    on<FetchHomeProgramsEvent>((event, emit) async {
      emit(HomeProgramsLoading());
      try {
        final programs = await repository.getHomePrograms(limit: event.limit);
        emit(HomeProgramsSuccess(programs));
      } catch (e) {
        emit(HomeProgramsFailure(e.toString()));
      }
    });
  }
}
