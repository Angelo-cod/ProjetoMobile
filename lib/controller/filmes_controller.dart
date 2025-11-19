import 'package:filmes/database/db_actions.dart';
import 'package:filmes/model/filme.dart';

class FilmesController {
  late FilmesDb filmesDb;
  
  FilmesController(){
    filmesDb = FilmesDb();
  }
  // Salva um objeto Filme no banco. Recebe o objeto Filme e retorna o id inserido (ou null em erro).
  Future<int?> save(Filme filme) async{
    return await filmesDb.save(filme);
  }
  Future<List<Filme>?> findAll() async{
    return await filmesDb.findAll();
    
  }
}