import 'package:bytebank/components/loading_buscar_dados.dart';
import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/Contato/contato.dart';
import 'package:bytebank/screens/contatos/contatos_formulario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Contatos';

const _tituloPossivelErro = 'Erro ao buscar os contatos';

const _tituloDaBuscaDeDado = 'Buscando os Contatos...';

class ContatosLista extends StatefulWidget {
  @override
  _ContatosListaState createState() => _ContatosListaState();
}

class _ContatosListaState extends State<ContatosLista> {
  final ContatoDao _contatoDao = ContatoDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1)).then(
          (value) => _contatoDao.findAll(),
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
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(contato);
                },
                itemCount: contatos.length,
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
                  builder: (context) => FormularioContatos(),
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

class _ItemContato extends StatelessWidget {
  final Contato _contato;

  const _ItemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contato.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          _contato.numeroConta.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
