// ignore_for_file: unnecessary_getters_setters

class FotoSQLiteModel {
  int _id = 0;
  String _localFoto = "";
  String _dataFoto;
  String _midia = "";
  String _descricao = "";
  int _idViagem;

  FotoSQLiteModel(this._id, this._localFoto, this._dataFoto, this._midia,
      this._descricao, this._idViagem);

  int get id => _id;
  set id(int id) {
    _id = id;
  }

  String get localFoto => _localFoto;

  set localFoto(String localFoto) {
    _localFoto = localFoto;
  }

  String get dataFoto => _dataFoto;

  set dataFoto(String dataFoto) {
    _dataFoto = dataFoto;
  }

  String get midia => _midia;

  set midia(String midia) {
    _midia = midia;
  }

  String get descricao => _descricao;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  int get idViagem => _idViagem;

  set encerrada(int idViagem) {
    _idViagem = idViagem;
  }
}
