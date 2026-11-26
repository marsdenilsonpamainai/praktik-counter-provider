import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Praktik Counter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<CounterModel>(
                builder: (context, counter, child) => Text('${counter.count}'),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterModel>().increment(),
                child: const Text('Tambah'),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterModel>().reset(),
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
