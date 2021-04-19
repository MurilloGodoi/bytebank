import 'package:bytebank/components/alerta_campos.dart';
import 'package:bytebank/models/Contato/contato.dart';
import 'package:flutter/material.dart';

class FormularioContatos extends StatefulWidget {
  @override
  _FormularioContatosState createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _controladorNome = TextEditingController();

  final TextEditingController _controladorNumeroConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Nome Completo'),
            controller: _controladorNome,
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Número da Conta'),
              controller: _controladorNumeroConta,
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text('Adicionar Contato'),
                onPressed: () {
                  _criaContato(context);
                },
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _criaContato(BuildContext context) {
    final String nome = _controladorNome.text;
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);

    if (_validarValoresContato(nome, numeroConta)) {
      final Contato contato = Contato(nome, numeroConta);
      Navigator.pop(context, contato);
    } else {
      alertaPreencherCamposCorretamente(context);
    }
  }

  bool _validarValoresContato(String nome, int numeroConta) {
    if (nome != null && numeroConta != null) {
      return true;
    }
    return false;
  }
}
