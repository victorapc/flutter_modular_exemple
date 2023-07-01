import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Argumentos: Recupera pelo Modular.args.data
                Modular.to.pushNamed('/categoria',
                    arguments: 'Categoria Teste Pelo Modular');
              },
              child: const Text('Categoria Module'),
            ),
            TextButton(
              onPressed: () {
                // NamedParameters: Recupera pelo Modular.args.params
                Modular.to.pushNamed('/produto/Produtos_Teste');
              },
              child: const Text('Produto Module'),
            ),
            TextButton(
              onPressed: () {
                // QueryParameters: Recupera pelo Modular.args.queryParams
                Modular.to.pushNamed('/produto/xyz?nome=Produto_XYZ');
              },
              child: const Text('Produto Query Param Module'),
            ),
          ],
        ),
      ),
    );
  }
}
