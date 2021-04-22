import 'package:bytebank/models/transferencia/transferencia.dart';
import 'package:sqflite/sqflite.dart';

import '../database_transferencias.dart';

const String _nomeTabela = 'transferencias';

class TransferenciaDao {
  static const String sql = 'CREATE TABLE $_nomeTabela('
    'id INTEGER PRIMARY KEY, '
    'valor DECIMAL(10,5), ' 
    'conta_destino INTEGER)';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await criarBancoDadosTransferencia();
    Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.insert(_nomeTabela, transferenciaMap);
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap['id'] = transferencia.id;
    transferenciaMap['valor'] = transferencia.valor;
    transferenciaMap['conta_destino'] = transferencia.numeroConta;
    return transferenciaMap;
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await criarBancoDadosTransferencia();
    final List<Map<String, dynamic>> resultados = await db.query(_nomeTabela);
    List<Transferencia> transferencias = _toList(resultados);
    return transferencias;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> resultados) {
    final List<Transferencia> transferencias = List();
    for (Map<String, dynamic> resultado in resultados) {
      final Transferencia transferencia = Transferencia(
          resultado['id'], resultado['valor'], resultado['conta_destino']);
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}


