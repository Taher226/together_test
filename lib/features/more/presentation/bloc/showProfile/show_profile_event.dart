part of 'show_profile_bloc.dart';

abstract class ShowProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowProfileRequestEvent extends ShowProfileEvent {
  final String token;
  ShowProfileRequestEvent(this.token);
  @override
  List<Object?> get props => [token];
}
