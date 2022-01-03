import 'package:busca_cep/home/cep_state.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:uno/uno.dart';

class CepStore extends NotifierStore<Exception, CepState> {
  CepStore() : super(CepConsulInitState());

  Future getCep(String cep) async {
    setLoading(true);
    try {
      final response = await Uno().get('https://viacep.com.br/ws/$cep/json/');
      update(CepConsulState(localidade: response.data['localidade']));
    } catch (e) {
      setError(Exception('Erro ao pesquiser'));
    }
    setLoading(false);
    return {};
  }
}
