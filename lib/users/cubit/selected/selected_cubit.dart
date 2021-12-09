import 'package:bloc/bloc.dart';
import 'package:bloc_app1/users/models/models.dart';
import 'package:get_it/get_it.dart';

class SelectedCubit extends Cubit<List<User>>{
  SelectedCubit(): super(<User>[]);

  void saveSelected(int id) async{
    try{
      if(!this.isSaved(id)){
        final user = await GetIt.I<UserRepository>().loadSingleUser(id: id);
        var newState = state;
        newState.add(user);
        emit(newState);
      }
      emit(state);
    }
    catch(_){
      emit(state);
    }
  }

  void deleteSelected(int id){
    if(this.isSaved(id)){
      var newState = state.where((element) => element.id != id).toList();
      emit(newState);
    }
    else{
      emit(state);
    }
    
  }


  bool isSaved(int id) => state.any((element) => element.id == id);
}