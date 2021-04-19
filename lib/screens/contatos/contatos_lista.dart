import 'package:bytebank/screens/contatos/contatos_formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContatosLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Murillo',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1000.0',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioContatos(),
                ),
              )
              .then((contato) => debugPrint(contato.nome));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
