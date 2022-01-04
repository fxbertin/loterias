import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria/dtos/rateio_premio.dart';
import 'package:loteria/dtos/municipio_ganhador.dart';
import 'package:loteria/dtos/resultado.dart';
import 'package:loteria/tipos_jogos.dart';

import '../web.dart';

class TelaResultado extends StatefulWidget {
  final Jogo _jogo;

  const TelaResultado(this._jogo);

  @override
  _TelaResultadoState createState() => _TelaResultadoState();
}

class _TelaResultadoState extends State<TelaResultado> {
  int? numero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado ${widget._jogo.nome}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<Resultado>(
            future: getResultado(numero, widget._jogo),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var retorno = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(
                      "Concurso: ${retorno.numero.toString()} - ${retorno.data}",
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    Wrap(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                numero = retorno.numero - 1;
                              });
                            },
                            child: const Text('Anterior')),
                        const SizedBox(
                          width: 8.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                numero = retorno.numero + 1;
                              });
                            },
                            child: const Text('Próximo')),
                      ],
                    ),
                    estaAcumulado(retorno),
                    dezenas(retorno.dezenas),
                    valorEspecial(retorno),
                    ganhadores(retorno.rateios),
                    detalhamento(retorno.municipiosGanhadores),
                  ]),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Visibility estaAcumulado(Resultado retorno) {
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
      visible: retorno.acumulado,
    );
  }

  Widget valorEspecial(Resultado resultado) {
    return Visibility(
        visible: resultado.tipoJogo == 'TIMEMANIA' ||
            resultado.tipoJogo == 'DIA_DE_SORTE',
        child: Text(
          resultado.tpValorEspecial() + resultado.nomeTimeCoracaoMesSorte,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ));
  }

  Widget dezenas(List<String> dezenas) {
    return Wrap(alignment: WrapAlignment.center, children: [
      for (var dezena in dezenas)
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget._jogo.cor,
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

  Widget ganhadores(List<RateioPremio> ganhadores) {
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

  Widget detalhamento(List<MunicipioGanhador> municipios) {
    return Column(children: [
      const Text(
        "Detalhamento",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      for (var dezena in municipios)
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dezena.enderecoCompleto(),
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
