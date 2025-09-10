part of 'home_programs_bloc.dart';

abstract class HomeProgramsState extends Equatable {
  const HomeProgramsState();

  @override
  List<Object?> get props => [];
}

class HomeProgramsInitial extends HomeProgramsState {}

class HomeProgramsLoading extends HomeProgramsState {}

class HomeProgramsSuccess extends HomeProgramsState {
  final List<Program> programs;

  const HomeProgramsSuccess(this.programs);

  @override
  List<Object?> get props => [programs];
}

class HomeProgramsFailure extends HomeProgramsState {
  final String error;

  const HomeProgramsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
