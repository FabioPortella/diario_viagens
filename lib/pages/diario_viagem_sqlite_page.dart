import 'package:diario_viagens/model/viagem_sqlite_model.dart';
import 'package:diario_viagens/repositories/viagem_sqlite_repository.dart';
import 'package:diario_viagens/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class ViagemPageSQLite extends StatefulWidget {
  const ViagemPageSQLite({super.key});

  @override
  State<ViagemPageSQLite> createState() => _ViagemPageSQLiteState();
}

class _ViagemPageSQLiteState extends State<ViagemPageSQLite> {
  ViagemSQLiteRepository viagemRepository = ViagemSQLiteRepository();
  var _viagem = const <ViagemSQLiteModel>[];
  var localViagemController = TextEditingController(text: "");
  var dataInicioViagemController = TextEditingController(text: "");
  var dataFinalViagemController = TextEditingController(text: "");
  var apenasNaoEncerradas = false;
  // ignore: prefer_typing_uninitialized_variables
  var dataInicio;
  // ignore: prefer_typing_uninitialized_variables
  var dataFinal;

  @override
  void initState() {
    super.initState();
    obterViagem();
  }

  void obterViagem() async {
    _viagem = await viagemRepository.obterDados(apenasNaoEncerradas);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diário de Viagens")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          localViagemController.text = "";
          dataInicioViagemController.text = "";
          dataInicio = null;
          dataFinalViagemController.text = "";
          dataFinal = null;
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  alignment: Alignment.centerLeft,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text(
                    "Adicionar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: StatefulBuilder(builder: (context, setState) {
                    return Wrap(
                      children: [
                        const TextLabel(texto: "Viagem para:"),
                        TextField(
                          controller: localViagemController,
                        ),
                        const TextLabel(texto: "Data o início da viagem"),
                        TextField(
                            controller: dataInicioViagemController,
                            readOnly: true,
                            onTap: () async {
                              dataInicio = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000, 1, 1),
                                  lastDate: DateTime(2050, 12, 31));
                              if (dataInicio != null) {
                                dataInicioViagemController.text =
                                    "${dataInicio.day}/${dataInicio.month}/${dataInicio.year}";
                              }
                            }),
                        const TextLabel(texto: "Data final"),
                        TextField(
                            controller: dataFinalViagemController,
                            readOnly: true,
                            onTap: () async {
                              dataFinal = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000, 1, 1),
                                  lastDate: DateTime(2050, 12, 31));
                              if (dataFinal != null) {
                                dataFinalViagemController.text =
                                    "${dataFinal.day}/${dataFinal.month}/${dataFinal.year}";
                              }
                            }),
                      ],
                    );
                  }),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          if (localViagemController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "O local da viagem dever ser preenchido - 3 caracteres ou mais.")));
                            return;
                          }
                          if (dataInicioViagemController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Data de início da viagem inválida")));
                            return;
                          }
                          if (dataFinalViagemController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Data final da viagem inválida. Favor informar uma data, mesmo que seja uma previsão.")));
                            return;
                          }
                          await viagemRepository.salvar(ViagemSQLiteModel(
                              0,
                              localViagemController.text,
                              dataInicioViagemController.text,
                              dataFinalViagemController.text,
                              false));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          obterViagem();
                          setState(() {});
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Viagem salva com sucesso")));
                        },
                        child: const Text("Salvar")),
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Somente viagens não encerradas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                      value: apenasNaoEncerradas,
                      onChanged: (bool value) {
                        apenasNaoEncerradas = value;
                        obterViagem();
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _viagem.length,
                itemBuilder: (BuildContext bc, int index) {
                  var viagem = _viagem[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await viagemRepository.remover(viagem.id);
                      obterViagem();
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Viagem foi excluida")));
                    },
                    key: Key(viagem.localViagem),
                    child: ListTile(
                      //leading: const Text(),
                      title: Text("Viagem: ${viagem.localViagem}"),
                      subtitle: Text(
                          "Inicio: ${viagem.dataInicio}\nFim:  ${viagem.dataFinal}"),
                      trailing: Switch(
                        onChanged: (bool value) async {
                          viagem.encerrada = value;
                          viagemRepository.atualizar(viagem);
                          obterViagem();
                        },
                        value: viagem.encerrada,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
