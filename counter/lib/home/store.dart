import 'package:flutter_triple/flutter_triple.dart';

class CounterStore extends NotifierStore<Exception, int> {
  CounterStore() : super(0);

  Future increment() async {
    setLoading(true);

    await Future.delayed(const Duration(milliseconds: 300));

    update(state + 1);

    setLoading(false);
  }

  reset() {
    update(0);
  }
}
