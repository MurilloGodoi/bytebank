import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/contato_dao.dart';

Future<Database> criarBancoDados() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.sql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


