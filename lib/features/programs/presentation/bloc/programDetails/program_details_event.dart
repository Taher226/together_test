part of 'program_details_bloc.dart';

abstract class ProgramDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProgramDetailsRequestEvent extends ProgramDetailsEvent {
  final int id;
  ProgramDetailsRequestEvent(this.id);

  @override
  List<Object?> get props => [id];
}
