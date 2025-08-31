part of 'organization_details_bloc.dart';

abstract class OrganizationDetailsEvent {}

class LoadOrganizationDetailsEvent extends OrganizationDetailsEvent {
  final String id;
  LoadOrganizationDetailsEvent(this.id);
}
