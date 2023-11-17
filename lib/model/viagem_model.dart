import 'package:hive/hive.dart';

part 'viagem_model.g.dart';

@HiveType(typeId: 1)
class ViagemModel extends HiveObject {
  @HiveField(0)
  String localViagem = "";

  @HiveField(1)
  DateTime? dataInicio;

  @HiveField(2)
  DateTime? dataFinal;

  @HiveField(3)
  bool encerrada = false;

  ViagemModel();

  ViagemModel.criar(
      this.localViagem, this.dataInicio, this.dataFinal, this.encerrada);
}
