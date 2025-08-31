part of 'organizations_bloc.dart';

abstract class OrganizationsEvent {}

class LoadOrganizationsEvent extends OrganizationsEvent {}

class FilterOrganizationsEvent extends OrganizationsEvent {
  final String query;
  FilterOrganizationsEvent(this.query);
}
