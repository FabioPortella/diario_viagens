import 'package:diario_viagens/model/viagem_sqlite_model.dart';
import 'package:diario_viagens/pages/fotos_sqlite_page.dart';
import 'package:diario_viagens/repositories/viagem_sqlite_repository.dart';
import 'package:diario_viagens/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

double defaultRadius = 8.0;

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
      appBar: AppBar(
        title: const Text("Diário de Viagens - Locais visitados"),
        backgroundColor: Colors.green,
      ),
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
                  Text(
                    "Viagens não encerradas",
                    style: TextStyle(fontSize: 20, color: Colors.grey[800]),
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
                    key: Key(viagem.localViagem),
                    child: GestureDetector(
                      // Chama a pagina de fotos -> FotosPageSQLite() ou CardPage()
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FotosPageSQLite(
                                      viagemId: viagem.id,
                                      viagemLocal: viagem.localViagem,
                                    )));
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
                              Row(
                                children: [
                                  Text(
                                    viagem.localViagem,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.grey[800]),
                                  ),
                                  const Spacer(),
                                  Switch(
                                    onChanged: (bool value) async {
                                      viagem.encerrada = value;
                                      viagemRepository.atualizar(viagem);
                                      obterViagem();
                                    },
                                    value: viagem.encerrada,
                                  ),
                                ],
                              ),
                              Text(
                                  "Início: ${viagem.dataInicio} \nFim: ${viagem.dataFinal}",
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

/// returns Radius
BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? defaultRadius));
}

/// returns Radius
Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ?? defaultRadius);
}

/*Load image from folder assets/images/  */
class ImgSample {
  static String get(String name) {
    return 'assets/images/$name';
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
