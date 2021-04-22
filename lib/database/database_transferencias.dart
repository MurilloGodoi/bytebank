
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/transferencia_dao.dart';

Future<Database> criarBancoDadosTransferencia() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank_transferencias.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TransferenciaDao.sql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}