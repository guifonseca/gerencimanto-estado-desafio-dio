import 'package:gerencimantoestadodesafiodio/model/tarefa_model.dart';
import 'package:gerencimantoestadodesafiodio/repositories/tarefa_repository.dart';
import 'package:gerencimantoestadodesafiodio/store/tarefa_store.dart';
import 'package:mobx/mobx.dart';

part 'lista_tarefas_store.g.dart';

class ListaTarefasStore = _ListaTarefasStore with _$ListaTarefasStore;

abstract class _ListaTarefasStore with Store {
  final TarefaRepository tarefaHiveRepository;

  final ObservableList<TarefaStore> _tarefas = <TarefaStore>[].asObservable();

  _ListaTarefasStore(this.tarefaHiveRepository);

  @computed
  List<TarefaStore> get tarefas => apenasNaoConcluidos
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas.toList();

  @observable
  bool apenasNaoConcluidos = false;

  @action
  setApenasNaoConcluidos(bool value) {
    apenasNaoConcluidos = value;
  }

  @action
  void adicionar(String descricao) {
    _tarefas.add(TarefaStore(descricao, false));
  }

  @action
  void alterar(String id, String descricao, bool concluido) {
    final tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }

  @action
  void obterDados() {
    final tarefas = tarefaHiveRepository.listar();
    for (var t in tarefas) {
      _tarefas.add(TarefaStore(t.descricao, t.concluido));
    }
  }

  @action
  void salvar() {
    tarefaHiveRepository.atualizarTarefas(_tarefas
        .map((t) => TarefaModel.criar(t.descricao, t.concluido))
        .toList());
  }
}
