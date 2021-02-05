import 'dart:async';
import 'package:dicas_e_macetes/streams/result_modal.dart';
import 'package:http/http.dart' as http;

class FutureContrroler {
  Future<ResultModal> addResult() async {
    try {
      final String url = "https://jsonplaceholder.typicode.com/todos/1";
      final result = await http.get(url);
      final ResultModal resultModal = ResultModal.fromJson(result.body);
      return resultModal;
    } catch (e) {
      print("addResult $e");
    }
  }
}

class StreamsContrroler {
  final _streamController = StreamController<ResultModal>();
  final FutureContrroler _futureContrroler = FutureContrroler();
  Stream<ResultModal> get myStream => _streamController.stream;

  void iniciarFluxo() async {
    try {
      var res = await _futureContrroler.addResult();
      _streamController.sink.add(res);
    } catch (e) {
      print("iniciarFluxo $e");
    }
  }
}
