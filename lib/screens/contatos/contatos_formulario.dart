import 'dart:math';

import 'package:bytebank/components/alerta_campos.dart';
import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/Contato/contato.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Novo Contato';

const _rotuloCampoNome = 'Nome Completo';
const _rotuloCampoNumeroConta = 'Número da Conta';

const _textoBotaoCriarContato = 'Adicionar Contato';
class FormularioContatos extends StatefulWidget {
  @override
  _FormularioContatosState createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _controladorNome = TextEditingController();

  final TextEditingController _controladorNumeroConta = TextEditingController();

  final ContatoDao _contatoDao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText:_rotuloCampoNome),
            controller: _controladorNome,
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              decoration: InputDecoration(labelText:_rotuloCampoNumeroConta ),
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
                child: Text(_textoBotaoCriarContato),
                onPressed: () =>_criaContato(context),
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
      var rng = new Random();
      final Contato contatoCriado = Contato(rng.nextInt(100),nome, numeroConta);
      _contatoDao.save(contatoCriado).then((id) => Navigator.pop(context));
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
