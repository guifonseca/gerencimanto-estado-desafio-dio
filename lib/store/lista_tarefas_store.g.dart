// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefasStore on _ListaTarefasStore, Store {
  Computed<List<TarefaStore>>? _$tarefasComputed;

  @override
  List<TarefaStore> get tarefas =>
      (_$tarefasComputed ??= Computed<List<TarefaStore>>(() => super.tarefas,
              name: '_ListaTarefasStore.tarefas'))
          .value;

  late final _$apenasNaoConcluidosAtom =
      Atom(name: '_ListaTarefasStore.apenasNaoConcluidos', context: context);

  @override
  bool get apenasNaoConcluidos {
    _$apenasNaoConcluidosAtom.reportRead();
    return super.apenasNaoConcluidos;
  }

  @override
  set apenasNaoConcluidos(bool value) {
    _$apenasNaoConcluidosAtom.reportWrite(value, super.apenasNaoConcluidos, () {
      super.apenasNaoConcluidos = value;
    });
  }

  late final _$_ListaTarefasStoreActionController =
      ActionController(name: '_ListaTarefasStore', context: context);

  @override
  dynamic setApenasNaoConcluidos(bool value) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.setApenasNaoConcluidos');
    try {
      return super.setApenasNaoConcluidos(value);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionar(String descricao) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.adicionar');
    try {
      return super.adicionar(descricao);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.alterar');
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluir(String id) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.excluir');
    try {
      return super.excluir(id);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void obterDados() {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.obterDados');
    try {
      return super.obterDados();
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void salvar() {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.salvar');
    try {
      return super.salvar();
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
apenasNaoConcluidos: ${apenasNaoConcluidos},
tarefas: ${tarefas}
    ''';
  }
}
