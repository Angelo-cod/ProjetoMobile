
class Filme {
  int id;
  String url;
  String titulo;
  String genero;
  String faixaEtaria;
  String duracao;
  String nota;
  String ano;
  String descricao;

  Filme(this.url, this.titulo, this.genero, this.faixaEtaria, this.duracao, this.nota, this.ano, this.descricao, {this.id = 0});

  Map<String, Object?> toMap(){
    return{
      "url": url,
      "titulo": titulo,
      "genero": genero,
      "faixaEtaria": faixaEtaria,
      "duracao": duracao,
      "nota": nota,
      "ano": ano,
      "descricao": descricao,
    };
  } 

  factory Filme.fromMap(Map<String, dynamic> map){
    return Filme(
      map['url'], 
      map['titulo'], 
      map['genero'], 
      map['faixaEtaria'],
      map['duracao'],
      map['nota'],
      map['ano'],
      map['descricao'],
      id: int.parse(map['id'])
      );
  }


  @override
  String toString(){
    return "[id: $id, titulo: $titulo]";
  }

}