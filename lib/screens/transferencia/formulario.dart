import 'package:bytebank/components/alerta_campos.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoNumeroConta = 'Número Conta';
const _dicaCampoNumeroConta = '1234';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '2000.00';

const textoBotaoCriarTransferencia = 'Criar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorValorTransferencia =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorValorTransferencia,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(textoBotaoCriarTransferencia),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorValorTransferencia.text);

    if (_validarValoresTransferencia(numeroConta, valor)) {
      final Transferencia transferenciaCriada = Transferencia(numeroConta, valor);
      Navigator.pop(context, transferenciaCriada);
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
