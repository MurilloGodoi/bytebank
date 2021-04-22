import 'package:bytebank/components/loading_buscar_dados.dart';
import 'package:bytebank/database/dao/transferencia_dao.dart';
import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'transferencias_formulario.dart';

const _tituloAppBar = 'Transferências';

const _tituloPossivelErro = 'Erro ao buscar as transferências';

const _tituloDaBuscaDeDado = 'Buscando as Transferências...';

class TransferenciasLista extends StatefulWidget {
  @override
  _TransferenciasListaState createState() => _TransferenciasListaState();
}

class _TransferenciasListaState extends State<TransferenciasLista> {
  final TransferenciaDao _transferenciaDao = TransferenciaDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Transferencia>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1)).then(
          (value) => _transferenciaDao.findAll(),
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
              
            case ConnectionState.waiting:
              return LoadingBuscarDados(_tituloDaBuscaDeDado);
              break;

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              final List<Transferencia> transferencias = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transferencia transferencia = transferencias[index];
                  return _ItemTransferencia(transferencia);
                },
                itemCount: transferencias.length,
              );
              break;
          }
          return Text(_tituloPossivelErro);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioTransferencia(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  _ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString())),
    );
  }
}
