import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main () {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
      { 
        'texto': 'Qual é a sua cor favorita?',
        'respostas': [
          { 'texto' : 'Vermelho' , 'pontuacao' : 7 },
          { 'texto' : 'Azul' , 'pontuacao' : 5 },
          { 'texto' : 'Branco' , 'pontuacao' : 1 },
          { 'texto' : 'Preto' , 'pontuacao' : 8 },
        ]
      },
      { 
        'texto': 'Qual é o seu animal favorito?',
        'respostas': [
          { 'texto' : 'Cachorro', 'pontuacao' : 10 }, 
          { 'texto' : 'Gato', 'pontuacao' : 1 }, 
          { 'texto' : 'Cobra', 'pontuacao' : 7 }, 
          { 'texto' : 'Aranha', 'pontuacao' : 3 },
        ]
      },
      { 
        'texto': 'Qual é o sua fruta favorita?',
        'respostas': [
          { 'texto' : 'Maça', 'pontuacao' : 10 }, 
          { 'texto' : 'Pessego', 'pontuacao' : 10 }, 
          { 'texto' : 'Kiwi', 'pontuacao' : 1 }, 
          { 'texto' : 'Uva', 'pontuacao' : 10 },
        ]
      },
      { 
        'texto': 'Qual é o seu gosto musical?',
        'respostas': [
          { 'texto' : 'Rock', 'pontuacao' : 10 }, 
          { 'texto' : 'Sertanejo', 'pontuacao' : 7 }, 
          { 'texto' : 'Rap', 'pontuacao' : 10 }, 
          { 'texto' : 'Funk', 'pontuacao' : 0 },
        ]
      },
    ];
  
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
  
  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder (int pontuacao) {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
        

    /* 
    / percorre a propriedade 'respostas' dentro do Map de widget, 
    / e retorna um widget Resposta com a String e Função responder
    / (Widget - Resposta()): componente que recebe os parametros, texto e função; 
    */
    // for (String respostasText in respostas) {
    //   widgets.add(Resposta(respostasText, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          quandoResponder: _responder,
          ) : Resultado(_pontuacaoTotal, _reiniciarPerguntas),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}