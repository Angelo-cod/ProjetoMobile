import 'package:filmes/database/db_connect.dart';

import 'package:filmes/model/filme.dart';

class FilmesDb{
  Future<Filme?> findById(int id) async{
    var db = await DbConnect.getDatabase();
    try{
      var mapContatos = await db.query(DbConnect.tables, where: "id=?", whereArgs: [id]);
      if(mapContatos.isNotEmpty){
        return Filme.fromMap(mapContatos.first);
      }else{
        return null;
      }
    }catch(e){
      print("Erro ao tentar buscar contato pelo id: ${e}");
      return null;
    }finally{
      db.close();
    }
  }

  Future<List<Filme>?> findAll() async{
    var db = await DbConnect.getDatabase();
    try{
      List<Map<String, dynamic>> mapFilmes = await db.query(DbConnect.tables);
      List<Filme> filmes = [];
      for(var map in mapFilmes){
        filmes.add(Filme.fromMap(map));
      }
      return filmes;
    }catch(e){
      print("Erro ao listar contatos: ${e}");
      return null;
    }finally{
      db.close();
    }
  }

  Future<int?> save(Filme filme) async{
    var db = await DbConnect.getDatabase();
    try{
      return db.insert(DbConnect.tables, filme.toMap());
    }catch(e){
      print('Erro ao inserir filme: $e');
      return null;
    }finally{
      await db.close();
    }
  }

  Future<int?> update(int id, Filme filme) async{
    final db = await DbConnect.getDatabase();
    try{
      return await db.update(DbConnect.tables, filme.toMap(), where: 'id = ?', whereArgs: [id]);
    }catch(e){
      print('Erro ao atualizar filme: $e');
      return null;
    }finally{
      await db.close();
    }
  }

  Future<int?> delete(int id) async{
    final db = await DbConnect.getDatabase();
    try{
      return await db.delete(DbConnect.tables, where: 'id = ?', whereArgs: [id]);
    }catch(e){
      print('Erro ao deletar filme: $e');
      return null;
    }finally{
      await db.close();
    }
  }
}