import 'package:flutter/material.dart';

class CamposForm extends StatelessWidget {
  final String hintText;

  const CamposForm({super.key, required this.hintText, required TextEditingController controller, required keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration: InputDecoration(
                labelText: hintText,
               // hintText: hintText,
              ),
              style: TextStyle(
                fontSize: 28.0,
              ),
            );
    }
  }


class MovieDetailCard extends StatelessWidget {
  final String titulo;
  final String genero;
  final String duracao;
  final String imageUrl; 
  final double rating;    

  const MovieDetailCard({
    Key? key,
    required this.titulo,
    required this.genero,
    required this.duracao,
    required this.imageUrl,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definimos a cor cinza clara, parecida com a da imagem
    const Color textColor = Colors.grey;
    
    // O Card atua como o container com sombra leve
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. Área do Pôster (Imagem)
            _MoviePoster(imageUrl: imageUrl),
            
            const SizedBox(width: 12.0),
            
            // 2. Área de Detalhes do Texto e Classificação
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Título
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  
                  // Gêneros
                  Text(
                    genero,
                    style: const TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  
                  // Duração
                  Text(
                    duracao,
                    style: const TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                  
                  // Espaçamento para empurrar a classificação para baixo
                  const SizedBox(height: 16.0),
                  
                  // Classificação por Estrelas
                  _StarRating(rating: rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar para exibir o pôster
class _MoviePoster extends StatelessWidget {
  final String imageUrl;

  const _MoviePoster({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // Usamos um Container para definir o tamanho da imagem e a margem
    return Container(
      width: 80, // Largura ajustável
      height: 120, // Altura ajustável
      // O 'BoxFit.cover' garante que a imagem preencha o espaço sem deformar
      child: Image.asset(
        imageUrl, 
        fit: BoxFit.cover,
        // Adicione um placeholder ou Image.network se usar URLs reais
      ),
    );
  }
}

// Widget auxiliar para exibir as estrelas
class _StarRating extends StatelessWidget {
  final double rating;

  const _StarRating({required this.rating});

  // Função para construir a linha de estrelas
  List<Widget> _buildStarRow() {
    final List<Widget> stars = [];
    final int fullStars = rating.floor();
    final bool hasHalfStar = (rating - fullStars) >= 0.5;

    // Estrelas Preenchidas
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.yellow, size: 20));
    }

    // Meia Estrela
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.yellow, size: 20));
    }

    // Estrelas Vazias (para completar 5)
    final int emptyStars = 5 - stars.length;
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_border, color: Colors.yellow, size: 20));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _buildStarRow(),
    );
  }
}
