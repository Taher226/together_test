import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/programs/data/models/program_details_model.dart';
import 'package:together_test/features/programs/data/repositories/program_details_repository.dart';

part 'program_details_event.dart';
part 'program_details_state.dart';

class ProgramDetailsBloc
    extends Bloc<ProgramDetailsEvent, ProgramDetailsState> {
  final ProgramDetailsRepository repository;
  ProgramDetailsBloc(this.repository) : super(ProgramDetailsInitial()) {
    on<ProgramDetailsRequestEvent>((event, emit) async {
      emit(ProgramDetailsLoading());
      try {
        final details = await repository.getProgramDetails(id: event.id);
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
