// ignore_for_file: unnecessary_getters_setters

class ViagemSQLiteModel {
  int _id = 0;
  String _localViagem = "";
  String _dataInicio;
  String _dataFinal;
  bool _encerrada = false;

  ViagemSQLiteModel(this._id, this._localViagem, this._dataInicio,
      this._dataFinal, this._encerrada);

  int get id => _id;
  set id(int id) {
    _id = id;
  }

  String get localViagem => _localViagem;

  set localViagem(String localViagem) {
    _localViagem = localViagem;
  }

  String get dataInicio => _dataInicio;

  set dataInicio(String dataInicio) {
    _dataInicio = dataInicio;
  }

  String get dataFinal => _dataFinal;

  set dataFinal(String dataFinal) {
    _dataFinal = dataFinal;
  }

  bool get encerrada => _encerrada;

  set encerrada(bool encerrada) {
    _encerrada = encerrada;
  }
}
