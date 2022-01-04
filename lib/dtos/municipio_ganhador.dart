import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MunicipioGanhador {
  int ganhadores;
  String municipio;
  String uf;

  MunicipioGanhador({
    required this.ganhadores,
    required this.municipio,
    required this.uf,
  });

  String enderecoCompleto() {
    var endereco = municipio;
    if (uf != "--") {
      endereco += " - " + uf;
    }

    return endereco += " - Ganhadores: $ganhadores";
  }

  factory MunicipioGanhador.fromJson(Map<String, dynamic> json) {
    return MunicipioGanhador(
      ganhadores: json['ganhadores'],
      municipio: json['municipio'],
      uf: json['uf'],
    );
  }
}
