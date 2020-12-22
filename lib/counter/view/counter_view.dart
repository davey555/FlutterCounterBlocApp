import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Cubit and Bloc Application")),
      body: Center(child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
          "$state", style: theme.headline2, 
          ); 
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key:const Key('counter_view_increment_button'),  
            onPressed: () => context.read<CounterCubit>().increment(),  
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10), 
          FloatingActionButton(
            key: const Key("counter_view_decrement_button"),
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
