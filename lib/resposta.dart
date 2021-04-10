import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String texto;
  final void Function() quandoSelecionar;

  Resposta(this.texto, this.quandoSelecionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
              color: Colors.red.shade900,
              textColor: Colors.white,
              child: Text(texto),
              onPressed: quandoSelecionar,
            ),
          );
  }
}