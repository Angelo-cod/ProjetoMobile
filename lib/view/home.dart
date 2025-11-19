import 'package:filmes/controller/filmes_controller.dart';
import 'package:filmes/view/tela_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:filmes/view/componentes/campos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _filmesController = FilmesController();

  void show() {
    
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Equipe"),
          content: Text("Angelo Gabriel, Gabriel Floro, Priscila Araújo"),
          actions: [
            TextButton(onPressed: (){
            Navigator.pop(context);
            }, 
            child: Text("Ok")),
          ],
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filmes', style: TextStyle(color: Colors.white, fontSize: 28.0),),
                IconButton(onPressed:show, icon: Icon(Icons.info), color: Colors.white, iconSize: 28.0),
              ]
            ),
        ),
        body: FutureBuilder(
          future: _filmesController.findAll(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var filmes = snapshot.data;

              return ListView.builder(
                itemCount: filmes!.length,
                itemBuilder: (context, index){
                  return MovieDetailCard(
                    titulo: (filmes[index].titulo),
                    genero: (filmes[index].genero),
                    duracao: (filmes[index].duracao),
                    imageUrl: (filmes[index].url), 
                    rating: (filmes[index].nota is num)
                        ? (filmes[index].nota as num).toDouble()
                        : double.tryParse(filmes[index].nota.toString()) ?? 0.0,
                  );
                },
              );

            }else if(snapshot.hasError){
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const FormCadastro(),
              ),
            );
          },
          mini: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Icon(Icons.add))
    );
  }
}

