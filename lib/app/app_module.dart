import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_module.dart';
import 'package:flutter_modular_example/app/produto/produto_module.dart';
import 'package:flutter_modular_example/app/splash/splash_page.dart';

class AppModule extends Module {
  // Caso adicionar injeção de dependência dentro do AppModule que é o módulo
  // principal do projeto, todos os objetos injestados será usado em todo projeto,
  // importante apenas para objetos que realmente for usado em todo sistema,
  // senão irá consumir de forma desnecessária memória. Caso usar injeção de
  // dependências dentro dos outros modulos apenas será usada de forma isolada no
  // móduto que fez injeção de dependência.
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ModuleRoute(
          '/categoria',
          module: CategoriaModule(),
        ),
        ModuleRoute(
          '/produto',
          module: ProdutoModule(),
        ),
      ];
}
