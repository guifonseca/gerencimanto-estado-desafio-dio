import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gerencimantoestadodesafiodio/main.dart';
import 'package:gerencimantoestadodesafiodio/store/lista_tarefas_store.dart';
import 'package:gerencimantoestadodesafiodio/store/tarefa_store.dart';

class TarefaItem extends StatelessWidget {
  final TarefaStore tarefa;

  const TarefaItem({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    final listaTarefasMobXStore = getIt<ListaTarefasStore>();

    return Observer(builder: (_) {
      return Dismissible(
        onDismissed: (direction) {
          listaTarefasMobXStore.excluir(tarefa.id);
        },
        key: Key(tarefa.descricao),
        child: ListTile(
          title: Text(tarefa.descricao),
          trailing: Switch(
            onChanged: (value) {
              tarefa.concluido = value;
              listaTarefasMobXStore.alterar(
                  tarefa.id, tarefa.descricao, tarefa.concluido);
            },
            value: tarefa.concluido,
          ),
        ),
      );
    });
  }
}
