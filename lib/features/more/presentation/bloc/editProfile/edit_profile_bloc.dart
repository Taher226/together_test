import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:together_test/features/more/domain/entities/edit_profile_entity.dart';
import 'package:together_test/features/more/domain/usecases/edit_profile_useCase.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase useCase;
  EditProfileBloc(this.useCase) : super(EditProfileInitial()) {
    on<EditProfileRequestEvent>((event, emit) async {
      emit(EditProfileLoading());
      try {
        final result = await useCase.call(
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
