import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/programs/data/models/programs_list_model.dart';
import 'package:together_test/features/programs/data/repositories/programs_list_repository.dart';

part 'programs_list_event.dart';
part 'programs_list_state.dart';

class ProgramsListBloc extends Bloc<ProgramsListEvent, ProgramsListState> {
  final ProgramsListRepository repository;
  ProgramsListBloc(this.repository) : super(ProgramsListInitial()) {
    on<FetchProgramsListEvent>((event, emit) async {
      emit(ProgramsListLoading());
      try {
        final programs = await repository.getProgramsList();
        emit(ProgramsListSuccess(programs));
      } catch (e) {
        emit(ProgramsListFailure(e.toString()));
      }
    });
  }
}
