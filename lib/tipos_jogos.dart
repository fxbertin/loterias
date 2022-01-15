import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Jogo {
  megaSena,
  quina,
  lotoFacil,
  diaSorte,
  timemania,
}

extension JogoExtension on Jogo {
  String get url {
    switch (this) {
      case Jogo.megaSena:
        return 'http://loterias.caixa.gov.br/wps/portal/loterias/landing/megasena/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOLNDH0MPAzcDbwMPI0sDBxNXAOMwrzCjA0sjIEKIoEKnN0dPUzMfQwMDEwsjAw8XZw8XMwtfQ0MPM2I02-AAzgaENIfrh-FqsQ9wNnUwNHfxcnSwBgIDUyhCvA5EawAjxsKckMjDDI9FQE-F4ca/dl5/d5/L2dBISEvZ0FBIS9nQSEh/pw/Z7_HGK818G0KO6H80AU71KG7J0072/res/id=buscaResultado/';
      case Jogo.quina:
        return 'http://loterias.caixa.gov.br/wps/portal/loterias/landing/quina/!ut/p/a1/jc69DoIwAATgZ_EJepS2wFgoaUswsojYxXQyTfgbjM9vNS4Oordd8l1yxJGBuNnfw9XfwjL78dmduIikhYFGA0tzSFZ3tG_6FCmP4BxBpaVhWQuA5RRWlUZlxR6w4r89vkTi1_5E3CfRXcUhD6osEAHA32Dr4gtsfFin44Bgdw9WWSwj/dl5/d5/L2dBISEvZ0FBIS9nQSEh/pw/Z7_HGK818G0K8ULB0QT4MEM8L0086/res/id=buscaResultado/';
      case Jogo.lotoFacil:
        return 'http://loterias.caixa.gov.br/wps/portal/loterias/landing/lotofacil/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOLNDH0MPAzcDbz8vTxNDRy9_Y2NQ13CDA0sTIEKIoEKnN0dPUzMfQwMDEwsjAw8XZw8XMwtfQ0MPM2I02-AAzgaENIfrh-FqsQ9wBmoxN_FydLAGAgNTKEK8DkRrACPGwpyQyMMMj0VAcySpRM!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/pw/Z7_61L0H0G0J0VSC0AC4GLFAD2003/res/id=buscaResultado/';
      case Jogo.diaSorte:
        return 'http://loterias.caixa.gov.br/wps/portal/loterias/landing/diadesorte/!ut/p/a1/jc5BDsIgFATQs3gCptICXdKSfpA2ujFWNoaVIdHqwnh-sXFr9c_qJ2-SYYGNLEzxmc7xkW5TvLz_IE6WvCoUwZPwArpTnZWD4SCewTGDlrQtZQ-gVGs401gj6wFw4r8-vpzGr_6BhZmIoocFYUO7toLemqYGz0H1AUsTZ7Cw4X7dj0hu9QIyUWUw/dl5/d5/L2dBISEvZ0FBIS9nQSEh/pw/Z7_HGK818G0KO5GE0Q8PTB11800G3/res/id=buscaResultado/';
      case Jogo.timemania:
        return 'http://loterias.caixa.gov.br/wps/portal/loterias/landing/timemania/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOLNDH0MPAzcDbz8vTxNDRy9_Y2NQ13CDA1MzIEKIoEKnN0dPUzMfQwMDEwsjAw8XZw8XMwtfQ0MPM2I02-AAzgaENIfrh-FqsQ9wBmoxN_FydLAGAgNTKEK8DkRrACPGwpyQyMMMj0VASrq9qk!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/pw/Z7_61L0H0G0JGJVA0AKLR5T3K00M4/res/id=buscaResultado/';
      default:
        return 'Error';
    }
  }

  String get nome {
    switch (this) {
      case Jogo.megaSena:
        return 'Mega-Sena';
      case Jogo.quina:
        return 'Quina';
      case Jogo.lotoFacil:
        return 'LotoFácil';
      case Jogo.diaSorte:
        return 'Dia de Sorte';
      case Jogo.timemania:
        return 'Timemania';
      default:
        return 'Error';
    }
  }

  Color get cor {
    switch (this) {
      case Jogo.megaSena:
        return Colors.green;
      case Jogo.quina:
        return Colors.deepPurple;
      case Jogo.lotoFacil:
        return Colors.purple;
      case Jogo.diaSorte:
        return const Color.fromRGBO(234, 225, 56, 50.0);
      case Jogo.timemania:
        return const Color.fromRGBO(100, 193, 21, 50.0);
      default:
        return Colors.black;
    }
  }
}
