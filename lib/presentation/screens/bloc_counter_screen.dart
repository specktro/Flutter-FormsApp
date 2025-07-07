import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void incrementCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncremented(value: value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) => Text('Bloc Counter: ${bloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterReset()), 
            icon: Icon(Icons.refresh_rounded)
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc bloc) => Text('Counter value: ${bloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => incrementCounterBy(context, 3)
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => incrementCounterBy(context, 2)
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => incrementCounterBy(context)
          ),
        ],
      ),
    );
  }
}
