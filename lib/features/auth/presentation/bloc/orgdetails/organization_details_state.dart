part of 'organization_details_bloc.dart';

abstract class OrganizationDetailsState {}

class OrganizationDetailsInitial extends OrganizationDetailsState {}

class OrganizationDetailsLoading extends OrganizationDetailsState {}

class OrganizationDetailsLoaded extends OrganizationDetailsState {
  final OrganizationDetailsModel organizationDetails;
  OrganizationDetailsLoaded(this.organizationDetails);
}

class OrganizationDetailsError extends OrganizationDetailsState {
  final String message;
  OrganizationDetailsError(this.message);
}
