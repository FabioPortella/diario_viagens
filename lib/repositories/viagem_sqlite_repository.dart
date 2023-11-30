import 'package:diario_viagens/model/viagem_sqlite_model.dart';
import 'package:diario_viagens/repositories/sqlite_database.dart';

class ViagemSQLiteRepository {
  Future<List<ViagemSQLiteModel>> obterDados(bool apenasNaoEncerradas) async {
    List<ViagemSQLiteModel> viagens = [];
    var db = await SQLiteDataBase().obterDataBase();

    var result = await db.rawQuery(apenasNaoEncerradas
        ? "SELECT id, local, inicio, final, encerrada FROM viagens WHERE encerrada = 0 ORDER BY inicio"
        : "SELECT id, local, inicio, final, encerrada FROM viagens ORDER BY inicio");
    for (var element in result) {
      viagens.add(ViagemSQLiteModel(
          int.parse(element["id"].toString()),
          element["local"].toString(),
          element["inicio"].toString(),
          element["final"].toString(),
          element["encerrada"] == 1));
    }
    return viagens;
  }

  Future<void> salvar(ViagemSQLiteModel viagemSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        "INSERT INTO viagens (local, inicio, final, encerrada) values(?, ?, ?, ?)",
        [
          viagemSQLiteModel.localViagem,
          viagemSQLiteModel.dataInicio,
          viagemSQLiteModel.dataFinal,
          viagemSQLiteModel.encerrada
        ]);
  }

  Future<void> atualizar(ViagemSQLiteModel viagemSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawUpdate(
        "UPDATE viagens SET local = ?, inicio = ?, final = ?, encerrada = ? WHERE id = ?",
        [
          viagemSQLiteModel.localViagem,
          viagemSQLiteModel.dataInicio,
          viagemSQLiteModel.dataFinal,
          viagemSQLiteModel.encerrada ? 1 : 0,
          viagemSQLiteModel.id
        ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawDelete("DELETE FROM viagens WHERE id = ?", [id]);
  }
}
