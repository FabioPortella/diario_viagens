import 'package:flutter/material.dart';
import 'package:diario_viagens/model/foto_sqlite_model.dart';
import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:diario_viagens/repositories/foto_sqlite_repository.dart';
import 'package:diario_viagens/shared/widgets/text_label.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'dart:io';

double defaultRadius = 8.0;

class FotosPageSQLite extends StatefulWidget {
  const FotosPageSQLite(
      {super.key, required this.viagemId, required this.viagemLocal});

  final int viagemId;
  final String viagemLocal;

  @override
  State<FotosPageSQLite> createState() => _FotosPageSQLiteState();
}

class _FotosPageSQLiteState extends State<FotosPageSQLite> {
  FotoSQLiteRepository fotoRepository = FotoSQLiteRepository();
  var _fotos = const <FotoSQLiteModel>[];
  var excluirController = TextEditingController(text: "");
  var localFotoController = TextEditingController(text: "");
  var dataFotoController = TextEditingController(text: "");
  var descricaoController = TextEditingController(text: "");
  // ignore: prefer_typing_uninitialized_variables
  var dataFoto;

  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
    obterFotos();
  }

  void obterFotos() async {
    _fotos = await fotoRepository.obterDados(widget.viagemId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diário de Viagens - Fotos"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ViagemPageSQLite()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? photo =
              await picker.pickImage(source: ImageSource.camera);
          if (photo != null) {
            String path =
                (await path_provider.getApplicationDocumentsDirectory()).path;
            String name = basename(photo.path);
            await photo.saveTo("$path/$name");
            await fotoRepository.salvar(FotoSQLiteModel(
                0,
                "",
                DateFormat("dd/MM/yyyy").format(DateTime.now()),
                "$path/$name",
                "",
                widget.viagemId));
            // ignore: use_build_context_synchronously
            obterFotos();
            setState(() {});
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Foto adicionada com sucesso")));
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Foto cancelada.")));
          }
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: MyColorsSample.primary,
                  width: 2,
                ),
              ),
              elevation: 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.viagemId} - ${widget.viagemLocal}",
                      style: TextStyle(fontSize: 22, color: Colors.grey[800]),
                    ),
                    Container(height: 5),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _fotos.length,
                itemBuilder: (BuildContext bc, int index) {
                  var foto = _fotos[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      File arquivoFoto = File(foto.midia);
                      await arquivoFoto.delete();
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
                          excluirController.text = "";
                          return AlertDialog(
                            title: const Text("Confirmar"),
                            content: Wrap(children: [
                              const Text(
                                  "Você realmente quer excluir este item?"),
                              const TextLabel(
                                  texto: "Informe o PIN de 4 digitos:"),
                              TextField(
                                controller: excluirController,
                                keyboardType: TextInputType.number,
                              ),
                            ]),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text("Cancelar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (excluirController.text == "1234") {
                                    Navigator.of(context).pop(true);
                                  } else {
                                    Navigator.of(context).pop(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "PIN inválido. Ação de exclusão cancelada.")));
                                  }
                                },
                                child: const Text("Excluir"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    key: Key(foto.localFoto),
                    child: GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.file(
                              File(foto.midia),
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("${foto.idViagem} - ${foto.dataFoto}",
                                      style: MyTextSample.button(context)!
                                          .copyWith(
                                              color: MyColorsSample.grey_20)),
                                  Container(height: 5),
                                  Text(foto.localFoto,
                                      style: MyTextSample.headline(context)!
                                          .copyWith(
                                              color: MyColorsSample.grey_80)),
                                  Container(height: 15),
                                  Text(foto.descricao,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[600])),
                                  Container(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      localFotoController.text = foto.localFoto;
                                      dataFotoController.text = foto.dataFoto;
                                      dataFoto = null;
                                      descricaoController.text = foto.descricao;

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return AlertDialog(
                                              alignment: Alignment.centerLeft,
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              title: const Text(
                                                "Adicionar",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: StatefulBuilder(
                                                  builder: (context, setState) {
                                                return SingleChildScrollView(
                                                  child: Wrap(
                                                    children: [
                                                      const TextLabel(
                                                          texto:
                                                              "Local da Foto:"),
                                                      TextField(
                                                        controller:
                                                            localFotoController,
                                                      ),
                                                      const TextLabel(
                                                          texto:
                                                              "Data da foto:"),
                                                      TextField(
                                                          controller:
                                                              dataFotoController,
                                                          readOnly: true,
                                                          onTap: () async {
                                                            dataFoto = await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate: DateFormat(
                                                                        "dd/MM/yyyy")
                                                                    .parse(foto
                                                                        .dataFoto),
                                                                firstDate:
                                                                    DateTime(
                                                                        2000,
                                                                        1,
                                                                        1),
                                                                lastDate:
                                                                    DateTime(
                                                                        2050,
                                                                        12,
                                                                        31));
                                                            if (dataFoto !=
                                                                null) {
                                                              dataFotoController
                                                                      .text =
                                                                  "${dataFoto.day}/${dataFoto.month}/${dataFoto.year}";
                                                            }
                                                          }),
                                                      const SizedBox(
                                                          height: 30),
                                                      const TextLabel(
                                                          texto: "Descrição:"),
                                                      TextField(
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(),
                                                        ),
                                                        controller:
                                                            descricaoController,
                                                        maxLines: null,
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                    ],
                                                  ),
                                                );
                                              }),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text("Cancelar")),
                                                TextButton(
                                                    onPressed: () async {
                                                      if (localFotoController
                                                              .text
                                                              .trim()
                                                              .length <
                                                          5) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "O local da foto dever ser preenchido - 5 caracteres ou mais.")));
                                                        return;
                                                      }
                                                      if (dataFotoController
                                                              .text ==
                                                          "") {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Data da foto inválida")));
                                                        return;
                                                      }
                                                      await fotoRepository.atualizar(
                                                          FotoSQLiteModel(
                                                              foto.id,
                                                              localFotoController
                                                                  .text,
                                                              dataFotoController
                                                                  .text,
                                                              foto.midia,
                                                              descricaoController
                                                                  .text,
                                                              widget.viagemId));
                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                      obterFotos();
                                                      setState(() {});
                                                      // ignore: use_build_context_synchronously
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      "Dados alterados com sucesso")));
                                                    },
                                                    child:
                                                        const Text("Salvar")),
                                              ],
                                            );
                                          });
                                    },
                                    child: Text('Editar',
                                        style: MyTextSample.button(
                                            context)!), //.copyWith(color: Colors.white)
                                  )
                                ],
                              ),
                            ),
                          ],
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

class MyColorsSample {
  static const Color primary = Color(0xFF12376F);
  static const Color primaryDark = Color(0xFF0C44A3);
  static const Color primaryLight = Color(0xFF43A3F3);
  static const Color green = Colors.green;
  static Color black = const Color(0xFF000000);
  static const Color accent = Color(0xFFFF4081);
  static const Color accentDark = Color(0xFFF50057);
  static const Color accentLight = Color(0xFFFF80AB);
  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);
  static const Color transparent = Color(0x00f7f7f7);
}

class MyTextSample {
  static TextStyle? display4(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? display3(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? display2(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? display1(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? headline(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle? subhead(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? body1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? button(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(letterSpacing: 1);
  }

  static TextStyle? subtitle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? overline(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}
