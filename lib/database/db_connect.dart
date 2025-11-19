

// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnect {
  
  static final String tables = 'filmes';

  static Future<Database> getDatabase() async{
    var dbPath = await getDatabasesPath();//data/data/pacote/databases
    var path = join(dbPath, "filmes.db");//data/data/pacote/databases/contatos.db
    return await openDatabase(path, onCreate: (db, version){
      db.execute("CREATE TABLE filmes("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "url TEXT, "
        "titulo TEXT, "
        "genero TEXT, "
        "faixaEtaria TEXT, "
        "nota TEXT, "
        "ano TEXT, "
        "descricao TEXT)");
  }, version: 3);
 }
}