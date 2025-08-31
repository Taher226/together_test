part of 'organizations_bloc.dart';

abstract class OrganizationsState {}

class OrganizationsInitial extends OrganizationsState {}

class OrganizationsLoading extends OrganizationsState {}

class OrganizationsLoaded extends OrganizationsState {
  final List<OrganizationsModel> organizations;
  OrganizationsLoaded(this.organizations);
}

class OrganizationsError extends OrganizationsState {
  final String message;
  OrganizationsError(this.message);
}
