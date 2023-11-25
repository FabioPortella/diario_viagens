import 'package:diario_viagens/model/foto_sqlite_model.dart';
import 'package:diario_viagens/repositories/sqlite_database.dart';

class FotoSQLiteRepository {
  Future<List<FotoSQLiteModel>> obterDados(int idViagem) async {
    List<FotoSQLiteModel> fotos = [];
    var db = await SQLiteDataBase().obterDataBase();

    var result =
        await db.rawQuery("SELECT * FROM foto WHERE id_viagem = ?", [idViagem]);
    for (var element in result) {
      fotos.add(FotoSQLiteModel(
          int.parse(element["id"].toString()),
          element["local_foto"].toString(),
          element["data_foto"].toString(),
          element["midia"].toString(),
          element["descricao"].toString(),
          int.parse(element["id_viagem"].toString())));
    }
    return fotos;
  }

  Future<void> salvar(FotoSQLiteModel fotoSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        "INSERT INTO foto (local_foto, data_foto, midia, descricao, id_viagem) values(?, ?, ?, ?, ?)",
        [
          fotoSQLiteModel.localFoto,
          fotoSQLiteModel.dataFoto,
          fotoSQLiteModel.midia,
          fotoSQLiteModel.descricao,
          fotoSQLiteModel.idViagem
        ]);
  }

  Future<void> atualizar(FotoSQLiteModel fotoSQLiteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawUpdate(
        "UPDATE foto SET local_foto = ?, data_foto = ?, descricao = ? WHERE id = ?",
        [
          fotoSQLiteModel.localFoto,
          fotoSQLiteModel.dataFoto,
          fotoSQLiteModel.descricao,
          fotoSQLiteModel.id,
        ]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawDelete("DELETE FROM foto WHERE id = ?", [id]);
  }
}
