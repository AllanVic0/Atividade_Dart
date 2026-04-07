import 'dart:io';

void main() {
  // Palavra secreta (pode ser aleatória ou fixa)
  String palavra = "FLUTTER".toUpperCase();

  // Estado do jogo
  List<String> letrasDescobertas = List.filled(palavra.length, '_');
  int tentativasErradas = 0;
  int maxTentativas = 6;

  List<String> letrasUsadas = [];

  print("=== JOGO DA FORCA ===");

  while (tentativasErradas < maxTentativas && letrasDescobertas.contains('_')) {
    print("\nPalavra: ${letrasDescobertas.join(' ')}");
    print("Letras usadas: ${letrasUsadas.join(', ')}");
    print("Tentativas restantes: ${maxTentativas - tentativasErradas}");

    stdout.write("Digite uma letra: ");
    String entrada = stdin.readLineSync()!.toUpperCase();

    if (entrada.length != 1 || !RegExp(r'[A-Z]').hasMatch(entrada)) {
      print("Digite apenas uma letra válida!");
      continue;
    }

    if (letrasUsadas.contains(entrada)) {
      print("Letra já usada, tente outra.");
      continue;
    }

    letrasUsadas.add(entrada);

    if (palavra.contains(entrada)) {
      // Revela todas as ocorrências
      for (int i = 0; i < palavra.length; i++) {
        if (palavra[i] == entrada) {
          letrasDescobertas[i] = entrada;
        }
      }
      print("✅ Acertou!");
    } else {
      tentativasErradas++;
      print("❌ Errou!");
    }

    printBoneco(tentativasErradas);
  }

  // Resultado final
  if (!letrasDescobertas.contains('_')) {
    print("\n🎉 Parabéns! Você venceu! A palavra era: $palavra");
  } else {
    print("\n💀 Você perdeu! A palavra era: $palavra");
  }
}

void printBoneco(int erros) {
  List<String> boneco = [
    "  +---+",
    "  |   |",
    "      |",
    "      |",
    "      |",
    "      |",
    "========="
  ];

  if (erros >= 1) boneco[2] = "  O   |";        // cabeça
  if (erros >= 2) boneco[3] = "  |   |";        // tronco
  if (erros >= 3) boneco[3] = " /|   |";       // braço esquerdo
  if (erros >= 4) boneco[3] = " /|\\  |";      // braço direito
  if (erros >= 5) boneco[4] = " /    |";       // perna esquerda
  if (erros >= 6) boneco[4] = " / \\  |";      // perna direita

  for (var linha in boneco) {
    print(linha);
  }
}