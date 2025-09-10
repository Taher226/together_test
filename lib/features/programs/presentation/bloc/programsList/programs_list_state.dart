part of 'programs_list_bloc.dart';

abstract class ProgramsListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProgramsListInitial extends ProgramsListState {}

class ProgramsListLoading extends ProgramsListState {}

class ProgramsListSuccess extends ProgramsListState {
  final ProgramsListModel programs;
  ProgramsListSuccess(this.programs);
}

class ProgramsListFailure extends ProgramsListState {
  final String error;

  ProgramsListFailure(this.error);
}
