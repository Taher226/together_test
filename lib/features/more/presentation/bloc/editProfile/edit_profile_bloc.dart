import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/data/models/edit_profile_model.dart';
import 'package:together_test/features/more/data/repositories/edit_profile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileRepository repository;
  EditProfileBloc(this.repository) : super(EditProfileInitial()) {
    on<EditProfileRequestEvent>((event, emit) async {
      emit(EditProfileLoading());
      try {
        final result = await repository.editProfile(
          token: event.token,
          method: event.method,
          firstName: event.firstName,
          lastName: event.lastName,
          address: event.address,
          phone: event.phone,
        );
        emit(EditProfileSuccess(result));
      } catch (e) {
        emit(EditProfileFailure(e.toString()));
      }
    });
  }
}
