import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_aula_1/app/app_controller.dart';
import 'package:slidy_aula_1/app/app_widget.dart';
import 'package:slidy_aula_1/app/pages/home/home_controller.dart';
import 'package:slidy_aula_1/app/pages/home/home_page.dart';
import 'package:slidy_aula_1/app/shared/repository/poke_repository.dart';
import 'package:slidy_aula_1/app/shared/utils/constans.dart';

class AppModule extends MainModule {
  // Array de injeção de dependências.
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
    Bind((i) => HomeController(i.get<PokeRepository>())),
    Bind((i) => PokeRepository(i.get<Dio>())),
    Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
  ];
  
  // Todas as rotas e qual pagina vai abrir.
  @override
  List<Router> get routers => [
    Router('/', child: (_, argms) => HomePage()),
  ];

  // Widget principal, onde inicia a aplicação.
  @override
  Widget get bootstrap => AppWidget();
}