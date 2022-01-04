import 'package:intl/intl.dart';

class RateioPremio {
  int faixa;
  int numeroDeGanhadores;
  double valorPremio;
  String descricaoFaixa;

  RateioPremio({
    required this.faixa,
    required this.numeroDeGanhadores,
    required this.valorPremio,
    required this.descricaoFaixa,
  });

  factory RateioPremio.fromJson(Map<String, dynamic> json) {
    return RateioPremio(
      faixa: json['faixa'],
      numeroDeGanhadores: json['numeroDeGanhadores'],
      valorPremio: json['valorPremio'],
      descricaoFaixa: json['descricaoFaixa'],
    );
  }

  String numeroApostasGanhadoras() {
    if (numeroDeGanhadores == 0) {
      return "Não houve ganhadores";
    }

    final ganhadoresFormatado =
        NumberFormat.decimalPattern().format(numeroDeGanhadores);
    final valorFormatado = NumberFormat.simpleCurrency().format(valorPremio);
    return "$ganhadoresFormatado apostas ganhadoras, $valorFormatado";
  }
}
