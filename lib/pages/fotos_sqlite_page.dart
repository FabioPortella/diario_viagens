import 'package:diario_viagens/model/foto_sqlite_model.dart';
import 'package:diario_viagens/pages/card_page.dart';
import 'package:diario_viagens/repositories/foto_sqlite_repository.dart';
import 'package:diario_viagens/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

double defaultRadius = 8.0;

class FotosPageSQLite extends StatefulWidget {
  const FotosPageSQLite({super.key});

  @override
  State<FotosPageSQLite> createState() => _FotosPageSQLiteState();
}

class _FotosPageSQLiteState extends State<FotosPageSQLite> {
  FotoSQLiteRepository fotoRepository = FotoSQLiteRepository();
  var _fotos = const <FotoSQLiteModel>[];
  var localFotoController = TextEditingController(text: "");
  var dataFotoController = TextEditingController(text: "");
  var descricaoController = TextEditingController(text: "");
  var idViagem = 1;
  // ignore: prefer_typing_uninitialized_variables
  var dataFoto;
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
    obterFotos();
  }

  void obterFotos() async {
    _fotos = await fotoRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diário de Viagens"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          localFotoController.text = "";
          dataFotoController.text = "";
          dataFoto = null;
          descricaoController.text = "";
          idViagem = 1;

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
                        const TextLabel(texto: "Local da foto:"),
                        TextField(
                          controller: localFotoController,
                        ),
                        const TextLabel(texto: "Data da foto"),
                        TextField(
                            controller: dataFotoController,
                            readOnly: true,
                            onTap: () async {
                              dataFoto = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000, 1, 1),
                                  lastDate: DateTime(2050, 12, 31));
                              if (dataFoto != null) {
                                dataFotoController.text =
                                    "${dataFoto.day}/${dataFoto.month}/${dataFoto.year}";
                              }
                            }),
                        const TextLabel(texto: "Descrição da foto:"),
                        TextField(
                          controller: descricaoController,
                        ),
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
                          if (localFotoController.text.trim().length < 5) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "O local da foto dever ser preenchido - 5 caracteres ou mais.")));
                            return;
                          }
                          if (dataFotoController.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Data da foto inválida")));
                            return;
                          }
                          await fotoRepository.salvar(FotoSQLiteModel(
                              0,
                              localFotoController.text,
                              dataFotoController.text,
                              "midia_foto",
                              descricaoController.text,
                              idViagem));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          obterFotos();
                          setState(() {});
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Foto salva com sucesso")));
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
            Expanded(
              child: ListView.builder(
                itemCount: _fotos.length,
                itemBuilder: (BuildContext bc, int index) {
                  var foto = _fotos[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await fotoRepository.remover(foto.id);
                      obterFotos();
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Foto foi excluida")));
                    },
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmar"),
                            content: const Text(
                                "Você realmente quer excluir este item?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text("Excluir"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    key: Key(foto.localFoto),
                    child: GestureDetector(
                      // também pode ser usado onLongPress
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CardPage()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: MyColorsSample.primary,
                            width: 2,
                          ),
                        ),
                        elevation: 0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                foto.localFoto,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.grey[800]),
                              ),
                              Text("Data: ${foto.dataFoto}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700])),
                              Text("Descrição: ${foto.descricao}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700])),
                            ],
                          ),
                        ),
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
