part of 'program_details_bloc.dart';

abstract class ProgramDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProgramDetailsInitial extends ProgramDetailsState {}

class ProgramDetailsLoading extends ProgramDetailsState {}

class ProgramDetailsSuccess extends ProgramDetailsState {
  final ProgramDetailsEntity entity;
  ProgramDetailsSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ProgramDetailsFailure extends ProgramDetailsState {
  final String error;
  ProgramDetailsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
