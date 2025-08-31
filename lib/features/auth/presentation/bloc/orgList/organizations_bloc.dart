import 'package:bloc/bloc.dart';
import 'package:together_test/features/auth/data/models/organizations_model.dart';
import 'package:together_test/features/auth/data/repositories/organization_repository.dart';

part 'organizations_event.dart';
part 'organizations_state.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  final OrganizationRepository repository;
  List<OrganizationsModel> allOrganizations = [];
  OrganizationsBloc(this.repository) : super(OrganizationsLoading()) {
    on<LoadOrganizationsEvent>((event, emit) async {
      try {
        final organizations = await repository.getOrganizations();
        allOrganizations = organizations;
        emit(OrganizationsLoaded(organizations));
      } catch (e) {
        emit(OrganizationsError(e.toString()));
      }
    });

    on<FilterOrganizationsEvent>((event, emit) async {
      if (event.query.isEmpty) {
        emit(OrganizationsLoaded(allOrganizations));
      } else {
        final filtered =
            allOrganizations
                .where(
                  (org) => org.name.toLowerCase().contains(
                    event.query.toLowerCase(),
                  ),
                )
                .toList();

        emit(OrganizationsLoaded(filtered));
      }
    });
  }
}
