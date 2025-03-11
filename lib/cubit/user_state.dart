// ignore_for_file: override_on_non_overriding_member

part of 'user_cubit.dart';

abstract class UserState {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoadingFailed extends UserState {
  final String message;

  UserLoadingFailed(this.message);
}
