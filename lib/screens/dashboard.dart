import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria/screens/resultado.dart';
import 'package:loteria/tipos_jogos.dart';

class Dashboard extends StatelessWidget {
  const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loterias"),
      ),
      body: SingleChildScrollView(child: jogos(context)),
    );
  }
}

Widget jogos(BuildContext context) {
  return Column(
    children: [
      for (var jogo in Jogo.values)
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaResultado(jogo)),
          ),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16.0),
            color: jogo.cor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:  Text(
                jogo.nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
    ],
  );
}
