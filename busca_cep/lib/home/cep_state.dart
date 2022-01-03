abstract class CepState {
  final String localidade;

  CepState({required this.localidade});
}

class CepConsulState extends CepState {
  CepConsulState({required String localidade}) : super(localidade: localidade);
}

class CepConsulInitState extends CepState {
  CepConsulInitState({String localidade = ''}) : super(localidade: localidade);
}
