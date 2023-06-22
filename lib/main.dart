import 'package:bloc_app/counter_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/counter_event.dart';
import 'package:bloc_app/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();

    return BlocProvider<CounterBloc>(
      create: (context) => bloc,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                bloc.add(CounterIncrementEvent());
              },
              icon: const Icon(Icons.plus_one),
            ),
            IconButton(
              onPressed: () {
                bloc.add(CounterDecrementEvent());
              },
              icon: const Icon(Icons.exposure_minus_1),
            ),
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
              bloc: bloc,
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: const TextStyle(fontSize: 50.0),
                );
              }),
        ),
      ),
    );
  }
}
