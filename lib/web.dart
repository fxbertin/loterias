import 'dart:convert';

import 'package:loteria/dtos/resultado.dart';
import 'package:http/http.dart' as http;
import 'package:loteria/tipos_jogos.dart';

Future<Resultado> getResultado(int? numero, Jogo jogo) async {
  var concurso = numero == null ? "" : "/p=concurso=${numero}";

  var url = jogo.url + concurso;

  final client = http.Client();
  final request = http.Request('GET', Uri.parse(url))
    ..followRedirects = false
    ..headers['cookie'] = 'security=true';

  final response = await client.send(request);

  if (response.statusCode == 200) {
    return Resultado.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  } else {
    throw Exception('Falha ao buscar os resultados');
  }
}