import 'package:flutter/material.dart';
import 'package:loteria/dtos/resultado.dart';

class Acumulado extends StatelessWidget {
  final Resultado resultado;

  const Acumulado({required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Acumulou',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      visible: resultado.acumulado,
    );
  }
}
