import 'package:flutter/material.dart';
import 'package:loteria/dtos/municipio_ganhador.dart';

class Detalhamento extends StatelessWidget {
  final List<MunicipioGanhador> municipios;

  const Detalhamento({required this.municipios});

  @override
  Widget build(BuildContext context) {
    if (municipios.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(children: [
      const Text(
        "Detalhamento",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      for (var municipio in municipios)
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                municipio.enderecoCompleto(),
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
