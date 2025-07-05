part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncremented extends CounterEvent {
  final int value;

  const CounterIncremented({this.value = 1});
}