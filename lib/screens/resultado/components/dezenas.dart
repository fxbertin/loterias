import 'package:flutter/material.dart';

class Dezenas extends StatelessWidget {
  final Color cor;
  final List<String> dezenas;

  const Dezenas({required this.dezenas, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.center, children: [
      for (var dezena in dezenas)
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cor,
          ),
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(10.0),
          child: Text(
            dezena,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
    ]);
  }
}