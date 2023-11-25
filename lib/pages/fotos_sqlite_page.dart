import 'package:diario_viagens/model/foto_sqlite_model.dart';
import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:diario_viagens/repositories/foto_sqlite_repository.dart';
import 'package:diario_viagens/shared/app_images.dart';
import 'package:diario_viagens/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        child: const Icon(Icons.add),
        onPressed: () {
          localFotoController.text = "";
          dataFotoController.text = "";
          dataFoto = null;
          descricaoController.text = "";

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
                    return SingleChildScrollView(
                      child: Wrap(
                        children: [
                          const TextLabel(texto: "Local da Foto:"),
                          TextField(
                            controller: localFotoController,
                          ),
                          const TextLabel(texto: "Data da foto:"),
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
                            decoration: const InputDecoration(
                              labelText: "informe aqui uma descrição da foto:",
                              border: OutlineInputBorder(),
                            ),
                            controller: descricaoController,
                            maxLines: null,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
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
                              widget.viagemId));
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

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              (foto.idViagem == 1)
                                  ? AppImages.paisagem1
                                  : (foto.idViagem == 2)
                                      ? AppImages.paisagem2
                                      : AppImages.paisagem3,
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
                                                            DateTime
                                                                initialDateTime =
                                                                dataFoto != null
                                                                    ? DateFormat(
                                                                            "dd/MM/yyyy")
                                                                        .parse(
                                                                            dataFoto)
                                                                    : DateTime
                                                                        .now();
                                                            dataFoto = await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    initialDateTime,
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
                                                              "midia_foto",
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
                                                                      "Foto salva com sucesso")));
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
