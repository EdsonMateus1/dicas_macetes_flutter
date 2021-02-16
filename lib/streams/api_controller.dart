import 'dart:async';
import 'dart:convert';
import 'package:dicas_e_macetes/streams/result_modal.dart';
import 'package:http/http.dart' as http;

class FutureContrroler {
  Future<List<ResultModal>> get getResult async {
    try {
      final String url = "https://jsonplaceholder.typicode.com/todos/";
      final result = await http.get(url);
      final List data = jsonDecode(result.body);
      final List<ResultModal> resultModals = data
          .map(
            (resultModal) => ResultModal.fromMap(resultModal),
          )
          .toList();
      return resultModals;
    } catch (e) {
      throw Exception("addResult $e");
    }
  }
}

class StreamsContrroler {
  final _streamController = StreamController<List<ResultModal>>();
  final FutureContrroler _futureContrroler = FutureContrroler();
  Stream<List<ResultModal>> get myStream => _streamController.stream;

  void iniciarFluxo() async {
    try {
      List<ResultModal> resultModals = await _futureContrroler.getResult;
      _streamController.sink.add(resultModals);
    } catch (e) {
      throw Exception("iniciarFluxo $e");
    }
  }

  Stream<List<ResultModal>> get iniciarStream async* {
    try {
      List<ResultModal> resultModals = await _futureContrroler.getResult;
      yield resultModals;
    } catch (e) {
      throw Exception("iniciarFluxo $e");
    }
  }

  void closeFluxo() {
    _streamController.close();
  }
}

// Um Futuro é como o token com um número nele que eles lhe dão
// quando você pede comida; você fez o pedido, mas o resultado ainda não está
//  pronto, mas você tem um espaço reservado. E quando o resultado estiver pronto,
//  você recebe um retorno de chamada (o quadro digital acima do balcão de retirada mostra seu
//  número ou eles gritam) - agora você pode entrar e pegar sua comida (o resultado) para tirar.

// Um Stream é como aquele cinto carregando pequenas tigelas de sushi. Sentando-se naquela mesa,
// você "se inscreveu" no fluxo. Você não sabe quando o próximo barco de sushi chegará -
// mas quando o chef (fonte de mensagem) colocá-lo no fluxo (cinto), então os assinantes
// vão recebê-lo. O importante a notar é que eles chegam assincronicamente
// (você não tem ideia de quando o próximo barco/mensagem virá), mas eles chegarão em sequência
// (ou seja, se o chef colocar três tipos de sushi no cinto, em alguma ordem - você vai vê-los vir
// por você na mesma ordem
