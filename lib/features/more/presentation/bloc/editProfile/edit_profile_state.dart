part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditProfileEntity entity;
  EditProfileSuccess(this.entity);
  @override
  List<Object?> get props => [entity];
}

class EditProfileFailure extends EditProfileState {
  final String error;
  EditProfileFailure(this.error);
  @override
  List<Object?> get props => [error];
}
