import 'package:filmes/controller/filmes_controller.dart';
import 'package:filmes/view/componentes/campos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:filmes/model/filme.dart';
import 'package:filmes/database/db_actions.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({super.key});

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  final TextEditingController duracaoController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  var _filmesController = FilmesController();
  String dropdownValue = 'Livre';
  double nota = 0.0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Cadastrar Filme", style: TextStyle(color: Colors.white, fontSize: 25.0,))
      ),
      body: Form(
        child: Column(
          children: [
            CamposForm(
              hintText: "URL Imagem", 
              controller: urlController, 
              keyboardType: TextInputType.text
            ),

            CamposForm(
              hintText: "Título", 
              controller: tituloController, 
              keyboardType: TextInputType.text
            ),

            CamposForm(
              hintText: "Gênero", 
              controller: generoController, 
              keyboardType: TextInputType.text
            ),

            Row(
              children: [
                Text("Faixa Etária  ", style: TextStyle(fontSize: 18.0)),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue){
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: [
                    DropdownMenuItem<String>(value: "Livre", child: Text("Livre")),
                    DropdownMenuItem<String>(value: "10", child: Text("10")),
                    DropdownMenuItem<String>(value: "12", child: Text("12")),
                    DropdownMenuItem<String>(value: "14", child: Text("14")),
                    DropdownMenuItem<String>(value: "16", child: Text("16")),
                    DropdownMenuItem<String>(value: "18", child: Text("18")),
                  ],
                ),
              ],
            ),

            CamposForm(
              hintText: "Duração", 
              controller: duracaoController, 
              keyboardType: TextInputType.number
            ),

            Row(
              children: [
                Text("Nota: ", style: TextStyle(fontSize: 18.0)),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 11.0),
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                  itemSize: 20.0,
                  
                  onRatingUpdate: (rating) { nota = rating; } ,
                ),
              ],
            ),

            CamposForm(
              hintText: "Ano", 
              controller: anoController, 
              keyboardType: TextInputType.number
            ),

            SizedBox( width: 25.0,),

            CamposForm(
              hintText: "Descrição", 
              controller: descricaoController, 
              keyboardType: TextInputType.text
            ),


          ], //children
        )
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _actionCadastrar();
          },
          mini: true,
          child: Icon(Icons.add))
    );
  }

  void _actionCadastrar() async{
    final String url = urlController.text.trim();
    final String titulo = tituloController.text.trim();
    final String genero = generoController.text.trim();
    final String faixa = dropdownValue;
    final int duracao = int.tryParse(duracaoController.text.trim()) ?? 0;
    final int ano = int.tryParse(anoController.text.trim()) ?? 0;
    final int notaInt = nota.round();
    final String descricao = descricaoController.text.trim();

    final filme = Filme(
      url,
      titulo,
      genero,
      faixa,
      duracao.toString(),
      notaInt.toString(),
      ano.toString(),
      descricao,
    );

    try {
      // tenta salvar e guarda retorno (id) caso exista
      final result = await _filmesController.save(filme);

      // Se save retornar algo (id) considera sucesso, se for null ou 0 mostra erro
      if (result != null && (result is int ? result > 0 : true)) {
        _showSnackBar("Filme cadastrado com sucesso!");
        Navigator.pop(context, true); // retorna true para a Home recarregar
      } else {
        _showSnackBar("Erro ao salvar o filme.");
      }
    } catch (e, st) {
      // mostra erro e imprime no console para debug
      _showSnackBar("Erro ao salvar: ${e.toString()}");
      print('Erro ao salvar filme: $e\n$st');
    }
  }

  void _showSnackBar(String value){
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(value)));
  }

}

