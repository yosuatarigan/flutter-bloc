import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(state is CounterLoded
          ? CounterLoded(state.number + event.number)
          : CounterLoded(event.number));
    });

    on<DecremenetEvent>((event, emit) {
      emit(state is CounterLoded
          ? CounterLoded(state.number - event.number)
          : const CounterLoded(-1));
    });
  }
}
