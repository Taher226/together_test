import 'package:bloc/bloc.dart';
import 'package:together_test/features/auth/data/models/organization_details_model.dart';
import 'package:together_test/features/auth/data/repositories/organization_repository.dart';

part 'organization_details_event.dart';
part 'organization_details_state.dart';

class OrganizationDetailsBloc
    extends Bloc<OrganizationDetailsEvent, OrganizationDetailsState> {
  final OrganizationRepository repository;
  OrganizationDetailsBloc(this.repository)
    : super(OrganizationDetailsInitial()) {
    on<LoadOrganizationDetailsEvent>((event, emit) async {
      emit(OrganizationDetailsLoading());
      try {
        final orgDetails = await repository.getOrganizationDetails(event.id);
        emit(OrganizationDetailsLoaded(orgDetails));
      } catch (e) {
        emit(
          OrganizationDetailsError(
            'Failed to load organization details: ${e.toString()}',
          ),
        );
      }
    });
  }
}
