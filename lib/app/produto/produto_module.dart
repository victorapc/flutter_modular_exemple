import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/produto/produto2_page.dart';
import 'package:flutter_modular_example/app/produto/produto_page.dart';

class ProdutoModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '${Modular.initialRoute}:nome',
          child: (context, args) => ProdutoPage(
            nome: args.params['nome'],
          ),
        ),
        ChildRoute(
          '${Modular.initialRoute}xyz',
          child: (context, args) => Produto2Page(
            nome: args.queryParams['nome'],
          ),
        ),
      ];
}
