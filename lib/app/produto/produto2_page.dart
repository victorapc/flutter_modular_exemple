import 'package:flutter/material.dart';

class Produto2Page extends StatelessWidget {
  final String? nome;

  const Produto2Page({super.key, this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto'),
      ),
      body: Column(
        children: [Text(nome ?? 'Nome não enviado')],
      ),
    );
  }
}
