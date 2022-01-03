import 'package:counter/home/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final counterStore = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder<CounterStore, Exception, int>(
        store: counterStore,
        onState: (context, state) => Center(
          child: Text(
            '$state',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        onError: (context, error) => Center(child: Text(error.toString())),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: counterStore.increment,
      ),
    );
  }
}
