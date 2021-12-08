
import 'package:bloc_app1/users/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object?> get props => [];
}


class UserLoaded extends UserEvent {}


class UserDelete extends UserEvent {
   final User user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];
    
}


class UserBan extends UserEvent {
   final User user;

  const UserBan(this.user);

  @override
  List<Object> get props => [user];
    
}


class UserRenew extends UserEvent {
   final User user;

  const UserRenew(this.user);

  @override
  List<Object> get props => [user];
    
}

class UserUpdate extends UserEvent {
   final User user;

  const UserUpdate(this.user);

  @override
  List<Object> get props => [user];
    
}