import 'dart:math';

import 'package:bytebank/components/alerta_campos.dart';
import 'package:bytebank/components/campo_text_form_transferencia.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Nova Transferência';

const _rotuloCampoNumeroConta = 'Número Conta';
const _dicaCampoNumeroConta = '1234';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '2000.00';

const _textoBotaoCriarTransferencia = 'Criar';

class FormularioTransferencia extends StatefulWidget {
  @override
  _FormularioTransferenciasState createState()=> _FormularioTransferenciasState();
}

class _FormularioTransferenciasState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorValorTransferencia =
      TextEditingController();

  final TransferenciaDao _transferenciaDao = TransferenciaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
            CampoTextFormTransferencias(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            CampoTextFormTransferencias(
                controlador: _controladorValorTransferencia,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
           Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(_textoBotaoCriarTransferencia),
                onPressed: () =>_criaTransferencia(context),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorValorTransferencia.text);

    if (_validarValoresTransferencia(numeroConta, valor)) {
      var rng = new Random();
      final Transferencia transferenciaCriada = Transferencia(rng.nextInt(100),valor, numeroConta);
      _transferenciaDao.save(transferenciaCriada).then((id) => Navigator.pop(context));
    } else {
      alertaPreencherCamposCorretamente(context);
    }
  }

  bool _validarValoresTransferencia(int numeroConta, double valor) {
    if (numeroConta != null && valor != null) {
      return true;
    }
    return false;
  }
}
