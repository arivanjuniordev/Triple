import 'package:busca_cep/home/cep_state.dart';
import 'package:busca_cep/home/cep_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final textEditingController = TextEditingController(text: '59646337');
  final store = CepStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cep:',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => store.getCep(textEditingController.text),
              child: const Text('Pesquisar'),
            ),
            const SizedBox(
              height: 20,
            ),
            ScopedBuilder<CepStore, Exception, CepState>(
              store: store,
              onState: (context, state) => Text(state.localidade),
              onError: (context, error) => Text(error.toString()),
              onLoading: (context) => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
