part of 'show_profile_bloc.dart';

abstract class ShowProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowProfileInitial extends ShowProfileState {}

class ShowProfileLoading extends ShowProfileState {}

class ShowProfileSuccess extends ShowProfileState {
  final ShowProfileEntity profile;
  ShowProfileSuccess(this.profile);
  @override
  List<Object?> get props => [profile];
}

class ShowProfileFailure extends ShowProfileState {
  final String error;
  ShowProfileFailure(this.error);
  @override
  List<Object?> get props => [error];
}
