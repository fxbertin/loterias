import 'package:flutter/material.dart';
import 'package:loteria/dtos/resultado.dart';

class ValorEspecial extends StatelessWidget {
  final Resultado resultado;

  const ValorEspecial({required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: resultado.temValorEspecial(),
      child: Text(
        resultado.tpValorEspecial() + resultado.nomeTimeCoracaoMesSorte,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
