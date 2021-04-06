import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() reiniciarPerguntas;

  Map<String, Object> objFrase = { 
    'saudacao' : '',
    'pontos' : ''
  };

  Resultado(this.pontuacao, this.reiniciarPerguntas);

  get fraseResultado {
    if( pontuacao < 8 ) {
      objFrase['saudacao'] = 'Parabéns!';
      objFrase['pontos'] = 'Sua pontuação foi ${pontuacao}';
      return objFrase;
    } else if( pontuacao < 16 ) {
      objFrase['saudacao'] = 'Você é bom!';
      objFrase['pontos'] = 'Sua pontuação foi ${pontuacao}';
      return objFrase;
    } else if ( pontuacao < 24 ) {
      objFrase['saudacao'] = 'Impressionante';
      objFrase['pontos'] = 'Sua pontuação foi ${pontuacao}';
      return objFrase;
    } else {
      objFrase['saudacao'] = 'Nível Jedi!';
      objFrase['pontos'] = 'Sua pontuação foi ${pontuacao}';
      return objFrase;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Center(
          child: Text(
          fraseResultado['saudacao'],
          style: TextStyle(fontSize: 40,
          color: Colors.blue,
            )
          )
        ),
        Center(
          child: Text(
          fraseResultado['pontos'].toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          )
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18)
          ),
          textColor: Colors.white,
          color: Colors.blue[300],
          onPressed: reiniciarPerguntas
        ),
      ],
    );
  }
}