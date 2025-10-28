import 'package:filmes/componentes/campos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  String dropdownValue = 'Livre';
  

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
              controller: tituloController, 
              keyboardType: TextInputType.text
            ),

            Row(
              children: [
                Text("Faixa Etária  ", style: TextStyle(fontSize: 28.0)),
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
                Text("Nota: ", style: TextStyle(fontSize: 16.0)),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsetsGeometry.symmetric(horizontal: 6.0, vertical: 11.0),
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                  itemSize: 20.0,
                  
                  // ignore: avoid_print
                  onRatingUpdate: (rating) {print(rating); } ,
                ),
              ],
            ),

            CamposForm(
              hintText: "Ano", 
              controller: anoController, 
              keyboardType: TextInputType.text
            ),

          ], //children
        )
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}

