import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gerencimantoestadodesafiodio/main.dart';
import 'package:gerencimantoestadodesafiodio/shared/widgets/tarefa_item.dart';
import 'package:gerencimantoestadodesafiodio/store/lista_tarefas_store.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  final _listaTarefasMobXStore = getIt<ListaTarefasStore>();

  final TextEditingController descricaoController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _listaTarefasMobXStore.obterDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        actions: [
          IconButton(
              onPressed: () {
                descricaoController.text = "";
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Adicionar Tarefa"),
                          content: TextField(
                            controller: descricaoController,
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancelar")),
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  _listaTarefasMobXStore
                                      .adicionar(descricaoController.text);
                                },
                                child: const Text("Adicionar"))
                          ],
                        ));
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Observer(builder: (_) {
                    return Switch(
                      value: _listaTarefasMobXStore.apenasNaoConcluidos,
                      onChanged: _listaTarefasMobXStore.setApenasNaoConcluidos,
                    );
                  })
                ],
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: _listaTarefasMobXStore.tarefas.length,
                  itemBuilder: (context, index) {
                    var tarefa = _listaTarefasMobXStore.tarefas[index];
                    return TarefaItem(tarefa: tarefa);
                  },
                );
              }),
            ),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 45,
                  child: FilledButton(
                      onPressed: () {
                        _listaTarefasMobXStore.salvar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Dados salvos com sucesso.")));
                      },
                      child: const Text("Salvar")),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
