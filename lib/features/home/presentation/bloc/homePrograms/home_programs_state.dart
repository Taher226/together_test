part of 'home_programs_bloc.dart';

abstract class HomeProgramsState extends Equatable {
  const HomeProgramsState();

  @override
  List<Object?> get props => [];
}

class HomeProgramsInitial extends HomeProgramsState {}

class HomeProgramsLoading extends HomeProgramsState {}

class HomeProgramsSuccess extends HomeProgramsState {
  final HomeProgramsEntity entity;

  const HomeProgramsSuccess(this.entity);

  @override
  List<Object?> get props => [entity];
}

class HomeProgramsFailure extends HomeProgramsState {
  final String error;

  const HomeProgramsFailure(this.error);

  @override
  List<Object?> get props => [error];
}
