import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/programs/domain/entities/programs_list_entity.dart';
import 'package:together_test/features/programs/domain/useCases/programs_list_useCase.dart';

part 'programs_list_event.dart';
part 'programs_list_state.dart';

class ProgramsListBloc extends Bloc<ProgramsListEvent, ProgramsListState> {
  final ProgramsListUseCase useCase;
  ProgramsListBloc(this.useCase) : super(ProgramsListInitial()) {
    on<FetchProgramsListEvent>((event, emit) async {
      emit(ProgramsListLoading());
      try {
        final programs = await useCase.call();
        emit(ProgramsListSuccess(programs));
      } catch (e) {
        emit(ProgramsListFailure(e.toString()));
      }
    });
  }
}
