import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/name%20and%20age/nameandage_bloc.dart';

import 'bloc/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => NameandageBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NameandageState nameagestate = context.watch<NameandageBloc>().state;
    return Scaffold(
        appBar: AppBar(
            title:
                //  BlocSelector<NameandageBloc, NameandageState, String>(
                //   selector: (state) {
                //     return state.name;
                //   },
                //   builder: (context, name) {
                //     return Text('Welcome $name');
                //   },
                // ),
                Text('Welcome ${nameagestate.name}')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Counter(),
              SizedBox(
                height: 30,
              ),
              ChangeNameandAge(),
            ],
          ),
        ));
  }
}

class ChangeNameandAge extends StatefulWidget {
  const ChangeNameandAge({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangeNameandAge> createState() => _ChangeNameandAgeState();
}

class _ChangeNameandAgeState extends State<ChangeNameandAge> {
  //texteditingcontroller
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int age = context.select<NameandageBloc, int>((value) => value.state.age);
    String name =
        context.select<NameandageBloc, String>((value) => value.state.name);
    //watch bloc

    return Column(
      children: [
        // BlocBuilder<NameandageBloc, NameandageState>(
        //   builder: (context, state) {
        //     return Text(
        //         'Hi, My name is ${state.name} and my age is ${state.age} years');
        //   },
        // ),
        Text('Hi, My name is $name and my age is $age years'),
        ElevatedButton(
            onPressed: () {
              context.read<NameandageBloc>().add(IncrementAgeEvent());
            },
            child: const Text('Birthday')),
        SizedBox(
          width: 300,
          child:
              //textform field with border
              TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              context
                  .read<NameandageBloc>()
                  .add(ChangeNameEvent(name: _nameController.text));
            },
            child: const Text('Change Name')),
        ElevatedButton(
            onPressed: () {
              context
                  .read<NameandageBloc>()
                  .add(ChangenameageEvent(name: _nameController.text, age: 22));
            },
            child: Text('ganti keduanya'))
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.number.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent(number: 2));
            },
            child: const Text('Increment')),
        ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecremenetEvent());
            },
            child: const Text('Decrement')),
      ],
    );
  }
}
