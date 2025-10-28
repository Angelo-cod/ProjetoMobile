import 'package:filmes/componentes/tela_cadastro.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
        body: Center(
          child: Text('Bem-vindo ao aplicativo de filmes!'),
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

