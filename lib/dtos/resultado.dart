import 'package:loteria/dtos/rateio_premio.dart';
import 'package:loteria/dtos/municipio_ganhador.dart';

class Resultado {
  final String tipoJogo;
  final int numero;
  final bool acumulado;
  final String data;
  final String nomeTimeCoracaoMesSorte;
  final List<String> dezenas;
  final List<RateioPremio> rateios;
  final List<MunicipioGanhador> municipiosGanhadores;

  Resultado(
      {required this.tipoJogo,
      required this.numero,
      required this.acumulado,
      required this.data,
      required this.nomeTimeCoracaoMesSorte,
      required this.dezenas,
      required this.rateios,
      required this.municipiosGanhadores});

  factory Resultado.fromJson(Map<String, dynamic> json) {
    var rateio = json['listaRateioPremio'];
    var rateios = new List<RateioPremio>.from(
        rateio.map((model) => RateioPremio.fromJson(model)));

    var stringMunicipiosGanhadores = json['listaMunicipioUFGanhadores'];
    var municipios = new List<MunicipioGanhador>.from(
        stringMunicipiosGanhadores.map((model) => MunicipioGanhador.fromJson(model)));

    var dezenasJson = json['listaDezenas'];
    List<String> dezenas =
        new List<String>.from(dezenasJson).map((e) => e.substring(1)).toList();
    return Resultado(
      tipoJogo: json['tipoJogo'],
      numero: json['numero'],
      acumulado: json['acumulado'],
      data: json['dataApuracao'],
      nomeTimeCoracaoMesSorte: json['nomeTimeCoracaoMesSorte'],
      dezenas: dezenas,
      rateios: rateios,
      municipiosGanhadores: municipios,
    );
  }

  bool temValorEspecial() {
    return tipoJogo == 'TIMEMANIA' || tipoJogo == 'DIA_DE_SORTE';
  }

  String tpValorEspecial() {
    if (tipoJogo == 'TIMEMANIA') {
      return "Time: ";
    } else if (tipoJogo == 'DIA_DE_SORTE') {
      return "Mês: ";
    } else {
      return "";
    }
  }
}
