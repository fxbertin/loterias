
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria/screens/resultado/components/detalhamento.dart';
import 'package:loteria/screens/resultado/components/dezenas.dart';
import 'package:loteria/screens/resultado/components/ganhadores.dart';
import 'package:loteria/screens/resultado/components/valor_especial.dart';
import 'package:loteria/dtos/resultado.dart';
import 'package:loteria/tipos_jogos.dart';

import '../../web.dart';
import 'components/acumulado.dart';

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
                          child: const Text('Anterior'),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numero = retorno.numero + 1;
                            });
                          },
                          child: const Text('Próximo'),
                        ),
                      ],
                    ),
                    Acumulado(resultado: retorno),
                    Dezenas(
                      dezenas: retorno.dezenas,
                      cor: widget._jogo.cor,
                    ),
                    ValorEspecial(resultado: retorno),
                    Ganhadores(ganhadores: retorno.rateios),
                    Detalhamento(municipios: retorno.municipiosGanhadores),
                  ]),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          numero = numero! - 1;
                        });
                      },
                      child: const Text('Voltar'),
                    ),
                    Text('Falha ao carregar o Resultado.'),
                  ],
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }



}
