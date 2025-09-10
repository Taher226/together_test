part of 'program_details_bloc.dart';

abstract class ProgramDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProgramDetailsInitial extends ProgramDetailsState {}

class ProgramDetailsLoading extends ProgramDetailsState {}

class ProgramDetailsSuccess extends ProgramDetailsState {
  final ProgramDetailsModel program;
  ProgramDetailsSuccess(this.program);

  @override
  List<Object?> get props => [program];
}

class ProgramDetailsFailure extends ProgramDetailsState {
  final String error;
  ProgramDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
