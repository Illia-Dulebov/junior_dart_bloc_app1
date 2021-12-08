import 'package:equatable/equatable.dart';
import 'package:bloc_app1/users/models/models.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> users;

  const UserLoadSuccess({required this.users});
  
  @override
  List<Object> get props => [users];

}

class UserLoadFailure extends UserState {}