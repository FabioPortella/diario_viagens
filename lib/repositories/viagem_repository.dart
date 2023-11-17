import 'package:diario_viagens/model/viagem_model.dart';
import 'package:hive/hive.dart';

class ViagemRepository {
  static late Box _box;

  ViagemRepository._criar();

  static Future<ViagemRepository> carregar() async {
    if (Hive.isBoxOpen("viagemModel")) {
      _box = Hive.box("viagemModel");
    } else {
      _box = await Hive.openBox("viagemModel");
    }
    return ViagemRepository._criar();
  }

  salvar(ViagemModel viagemModel) {
    _box.add(viagemModel);
  }

  alterar(ViagemModel viagemModel) {
    viagemModel.save();
  }

  excluir(ViagemModel viagemModel) {
    viagemModel.delete();
  }

  List<ViagemModel> obterDados(bool naoEncerrada) {
    if (naoEncerrada) {
      return _box.values
          .cast<ViagemModel>()
          .where((element) => !element.encerrada)
          .toList();
    }
    return _box.values.cast<ViagemModel>().toList();
  }
}