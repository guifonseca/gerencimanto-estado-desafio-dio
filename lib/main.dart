import 'package:flutter/material.dart';
import 'package:gerencimantoestadodesafiodio/model/tarefa_model.dart';
import 'package:gerencimantoestadodesafiodio/pages/tarefa_page.dart';
import 'package:gerencimantoestadodesafiodio/repositories/impl/tarefa_repository_impl.dart';
import 'package:gerencimantoestadodesafiodio/repositories/tarefa_repository.dart';
import 'package:gerencimantoestadodesafiodio/store/lista_tarefas_store.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<TarefaRepository>(
      await TarefaRepositoryImpl.carregar());
  getIt.registerSingleton<ListaTarefasStore>(
      ListaTarefasStore(getIt<TarefaRepository>()));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(TarefaModelAdapter());

  await setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Gerenciamento de Estado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
            color: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            actionsIconTheme: IconThemeData(color: Colors.white, size: 26)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: const TarefaPage(),
    );
  }
}
