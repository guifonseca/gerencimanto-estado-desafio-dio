import 'package:gerencimantoestadodesafiodio/model/tarefa_model.dart';

abstract class TarefaRepository {
  void salvar(TarefaModel tarefaHiveModel);
  List<TarefaModel> listar();
  List<TarefaModel> obterDados(bool naoConcluido);
  void alterar(TarefaModel tarefaHiveModel);
  void excluir(TarefaModel tarefaHiveModel);
  void atualizarTarefas(List<TarefaModel> tarefas);
}
