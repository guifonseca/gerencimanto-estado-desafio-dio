import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_store.g.dart';

class TarefaStore = _TarefaStore with _$TarefaStore;

abstract class _TarefaStore with Store {
  final String id = UniqueKey().toString();
  @observable
  String descricao = "";
  @observable
  bool concluido = false;

  _TarefaStore(this.descricao, this.concluido);

  @action
  void alterar(String descricao, bool concluido) {
    this.descricao = descricao;
    this.concluido = concluido;
  }
}
