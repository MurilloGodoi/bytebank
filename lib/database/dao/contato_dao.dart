import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/Contato/contato.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

const String _nomeTabela = 'contatos';

class ContatoDao {
  static const String sql = 'CREATE TABLE $_nomeTabela('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'numero_conta INTEGER)';

  Future<int> save(Contato contato) async {
    final Database db = await criarBancoDados();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_nomeTabela, contatoMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['id'] = contato.id;
    contatoMap['nome'] = contato.nome;
    contatoMap['numero_conta'] = contato.numeroConta;
    return contatoMap;
  }

  Future<List<Contato>> findAll() async {
    final Database db = await criarBancoDados();
    final List<Map<String, dynamic>> resultados = await db.query(_nomeTabela);
    List<Contato> contatos = _toList(resultados);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> resultados) {
    final List<Contato> contatos = List();
    for (Map<String, dynamic> resultado in resultados) {
      final Contato contato = Contato(
          resultado['id'], resultado['nome'], resultado['numero_conta']);
      contatos.add(contato);
    }
    return contatos;
  }
}
