import 'package:gerencimantoestadodesafiodio/model/tarefa_model.dart';
import 'package:gerencimantoestadodesafiodio/repositories/tarefa_repository.dart';
import 'package:hive/hive.dart';

class TarefaRepositoryImpl implements TarefaRepository {
  static late Box _box;

  TarefaRepositoryImpl._criar();

  static Future<TarefaRepositoryImpl> carregar() async {
    if (Hive.isBoxOpen('tarefaHiveModel')) {
      _box = Hive.box('tarefaHiveModel');
    } else {
      _box = await Hive.openBox('tarefaHiveModel');
    }
    return TarefaRepositoryImpl._criar();
  }

  @override
  void salvar(TarefaModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  @override
  List<TarefaModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaModel>()
          .where((element) => !element.concluido)
          .toList();
    }

    return _box.values.cast<TarefaModel>().toList();
  }

  @override
  void alterar(TarefaModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  @override
  void excluir(TarefaModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }

  @override
  void atualizarTarefas(List<TarefaModel> tarefas) async {
    await _box.clear();
    for (var t in tarefas) {
      salvar(t);
    }
  }

  @override
  List<TarefaModel> listar() {
    return _box.values.cast<TarefaModel>().toList();
  }
}
