import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/programs/domain/entities/program_details_entity.dart';
import 'package:together_test/features/programs/domain/useCases/program_details_useCase.dart';

part 'program_details_event.dart';
part 'program_details_state.dart';

class ProgramDetailsBloc
    extends Bloc<ProgramDetailsEvent, ProgramDetailsState> {
  final ProgramDetailsUseCase useCase;
  ProgramDetailsBloc(this.useCase) : super(ProgramDetailsInitial()) {
    on<ProgramDetailsRequestEvent>((event, emit) async {
      emit(ProgramDetailsLoading());
      try {
        final details = await useCase.call(id: event.id);
        if (details.data != null) {
          emit(ProgramDetailsSuccess(details));
        } else {
          emit(ProgramDetailsFailure("No data found"));
        }
      } catch (e) {
        emit(ProgramDetailsFailure(e.toString()));
      }
    });
  }
}
