import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_example/app/categoria/categoria_page.dart';
import 'package:flutter_modular_example/app/categoria/model/categoria_controller.dart';
import 'package:flutter_modular_example/app/categoria/model/observacao_model.dart';
import 'package:flutter_modular_example/app/categoria/model/preco_model.dart';
import 'package:flutter_modular_example/app/produto/produto_module.dart';

class CategoriaModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // isLazy: instanciar a classe de forma tardia sendo true como padrão.
        //         Caso passar isLazy pra false ele irá instanciar a classe assim
        //         que carregar o módulo.
        //Bind((i) => CategoriaController()),

        // ObservacaoModel está declarado dentrdo o PrecoModel, nesse caso é
        // necessário fazer também export para o módulo passar para sua página sem
        // conter erros.
        Bind.lazySingleton((i) => ObservacaoModel(), export: true),
        // PrecoModel irá ser exportado para o ProdutoModule.
        Bind.lazySingleton((i) => PrecoModel(obs: i()), export: true),
        // isLazy = true / isSingleton = true.
        // Para adicionar o Preco Model como injeção existe 2 formas no parametro.
        // Sendo: i() ou i.get()
        Bind.lazySingleton((i) => CategoriaController(precoModel: i())),

        // isLazy = false / isSingleton = true.
        //Bind.singleton((i) => CategoriaController()),

        // isLazy = true / isSingleton = false.
        //Bind.factory((i) => CategoriaController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => CategoriaPage(
            categoria: args.data,
          ),
        ),
        ModuleRoute(
          '/produto',
          module: ProdutoModule(),
        ),
      ];
}
