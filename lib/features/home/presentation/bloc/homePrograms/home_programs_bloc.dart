import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/home/domain/entities/home_programs_entity.dart';
import 'package:together_test/features/home/domain/useCases/home_programs_useCase.dart';

part 'home_programs_event.dart';
part 'home_programs_state.dart';

class HomeProgramsBloc extends Bloc<HomeProgramsEvent, HomeProgramsState> {
  final HomeProgramsUseCase useCase;
  HomeProgramsBloc(this.useCase) : super(HomeProgramsInitial()) {
    on<FetchHomeProgramsEvent>((event, emit) async {
      emit(HomeProgramsLoading());
      try {
        final programs = await useCase.call(event.limit);
        emit(HomeProgramsSuccess(programs));
      } catch (e) {
        emit(HomeProgramsFailure(e.toString()));
      }
    });
  }
}
