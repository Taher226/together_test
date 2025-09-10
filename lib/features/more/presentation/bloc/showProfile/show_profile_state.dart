part of 'show_profile_bloc.dart';

abstract class ShowProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowProfileInitial extends ShowProfileState {}

class ShowProfileLoading extends ShowProfileState {}

class ShowProfileSuccess extends ShowProfileState {
  final ShowProfileModel model;
  ShowProfileSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class ShowProfileFailure extends ShowProfileState {
  final String error;
  ShowProfileFailure(this.error);
  @override
  List<Object?> get props => [error];
}
