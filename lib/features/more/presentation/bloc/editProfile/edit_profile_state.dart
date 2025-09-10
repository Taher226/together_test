part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditProfileModel model;
  EditProfileSuccess(this.model);
  @override
  List<Object?> get props => [model];
}

class EditProfileFailure extends EditProfileState {
  final String error;
  EditProfileFailure(this.error);
  @override
  List<Object?> get props => [error];
}
