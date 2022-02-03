import 'package:flutter/material.dart';
import 'package:loteria/dtos/rateio_premio.dart';

class Ganhadores extends StatelessWidget {
  final List<RateioPremio> ganhadores;

  const Ganhadores({required this.ganhadores}) ;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Premiação",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      for (var dezena in ganhadores)
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dezena.descricaoFaixa,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dezena.numeroApostasGanhadoras(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
    ]);
  }
}
