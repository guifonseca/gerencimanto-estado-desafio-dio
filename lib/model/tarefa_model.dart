import 'package:hive/hive.dart';

part 'tarefa_model.g.dart';

@HiveType(typeId: 1)
class TarefaModel extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  bool concluido = false;

  TarefaModel();

  TarefaModel.criar(this.descricao, this.concluido);
}
