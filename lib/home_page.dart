import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_dart/counter_cubit.dart';
import 'package:stream_dart/counter_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:state.wasIncerement ? Text('incerement'):Text('decrement'),
         duration:const Duration(milliseconds: 200),
           ),
          );
        },
        child: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counterValue}',
                style: const TextStyle(fontSize: 32),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 45,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              context.read<CounterCubit>().incerement();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.minimize,
              size: 45,
              color: Colors.deepOrange,
            ),
            onPressed: () {
              context.read<CounterCubit>().decerement();
            },
          ),
        ],
      ),
    );
  }
}
