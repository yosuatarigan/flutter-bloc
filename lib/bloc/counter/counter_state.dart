part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int number;

  const CounterState(this.number);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterLoded extends CounterState {
  const CounterLoded(int number) : super(number);
}
