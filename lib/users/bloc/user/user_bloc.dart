import 'package:bloc/bloc.dart';
import 'package:bloc_app1/users/models/models.dart';
import 'package:bloc_app1/users/bloc/user/user.dart';
import 'package:get_it/get_it.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  UserBloc() : super(UserLoadInProgress()){
    on<UserLoaded>(_onUserLoaded);
    on<UserDelete>(_onUserDelete);
    on<UserBan>(_onUserBan);
    on<UserRenew>(_onUserRenew);
    on<UserUpdate>(_onUserUpdate);
  }


 void _onUserLoaded(UserLoaded event, Emitter<UserState> emit) async {
   try{
      final users = await GetIt.I<UserRepository>().loadUsers();
      emit(UserLoadSuccess(users: users));
    }
    catch(_){
      emit(UserLoadFailure());
    }
}


 void _onUserDelete(UserDelete event, Emitter<UserState> emit) async {
   if(state is UserLoadSuccess){
      final updatedUsers = (state as UserLoadSuccess)
          .users
          .where((user) => user.id != event.user.id)
          .toList();
    emit(UserLoadSuccess(users: updatedUsers));
   }
}


void _onUserBan(UserBan event, Emitter<UserState> emit) async {
   if(state is UserLoadSuccess){
      final updatedUsers = (state as UserLoadSuccess)
          .users
          .map((user) => user.id == event.user.id ? event.user : user)
          .toList();
    emit(UserLoadSuccess(users: updatedUsers));
   }
}


void _onUserRenew(UserRenew event, Emitter<UserState> emit) async {
   if(state is UserLoadSuccess){
      final updatedUsers = (state as UserLoadSuccess)
          .users
          .map((user) => user.id == event.user.id ? event.user : user)
          .toList();
    emit(UserLoadSuccess(users: updatedUsers));
   }
}

void _onUserUpdate(UserUpdate event, Emitter<UserState> emit) async {
   if(state is UserLoadSuccess){
      final updatedUsers = (state as UserLoadSuccess)
          .users
          .map((user) => user.id == event.user.id ? event.user : user)
          .toList();
    emit(UserLoadSuccess(users: updatedUsers));
   }
}




}