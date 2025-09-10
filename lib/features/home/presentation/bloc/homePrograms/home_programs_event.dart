part of 'home_programs_bloc.dart';

abstract class HomeProgramsEvent extends Equatable {
  const HomeProgramsEvent();

  @override
  List<Object?> get props => [];
}

class FetchHomeProgramsEvent extends HomeProgramsEvent {
  final int limit;

  const FetchHomeProgramsEvent({this.limit = 5});

  @override
  List<Object?> get props => [limit];
}
