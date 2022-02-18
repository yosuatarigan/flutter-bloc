import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nameandage_event.dart';
part 'nameandage_state.dart';

class NameandageBloc extends Bloc<NameandageEvent, NameandageState> {
  NameandageBloc() : super(const NameandageInitial()) {
    on<IncrementAgeEvent>((event, emit) {
      // emit(state is NameandageLoaded
      //     ? NameandageLoaded(name: state.name, age: state.age + event.age)
      //     : NameandageLoaded(name: state.name, age: state.age));
      emit(NameandageLoaded(name: state.name, age: state.age + event.age));
    });

    on<ChangeNameEvent>((event, emit) {
      // emit(state is NameandageLoaded
      //     ? NameandageLoaded(name: event.name, age: state.age)
      //     : NameandageLoaded(name: state.name, age: state.age));
      emit(NameandageLoaded(name: event.name, age: state.age));
    });

    on<ChangenameageEvent>((event, emit) {
      // emit(state is NameandageLoaded
      //     ? NameandageLoaded(name: event.name, age: event.age)
      //     : NameandageLoaded(name: state.name, age: state.age));
      emit(NameandageLoaded(name: event.name, age: event.age));
    });
  }
}
