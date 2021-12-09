part of 'main.dart';

class MyBloc extends Bloc<PageEvent, PageState> {
  MyBloc() : super(Main()) {
    on<MainEvent>((event, emit) => emit(Main()));
    on<IlliaEvent>((event, emit) => emit(Illia()));
    on<DimaEvent>((event, emit) => emit(Dima()));
    on<AnyaEvent>((event, emit) => emit(Anya()));
  }
}
