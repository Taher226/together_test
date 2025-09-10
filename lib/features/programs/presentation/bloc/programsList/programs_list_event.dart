part of 'programs_list_bloc.dart';

abstract class ProgramsListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProgramsListEvent extends ProgramsListEvent {}
