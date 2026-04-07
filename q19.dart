import 'dart:io';

// Esse tabuleiro tem as bordas enumeradas para ficar mais fácil de compreender
void main() {
  List<List<String>> tabuleiro = List.generate(3, (_) => List.filled(3, ' '));

  String jogadorAtual = 'X';

  while (true) {
    printTabuleiro(tabuleiro);

    // Entrada do jogador
    int linha = -1, coluna = -1;
    while (true) {
      stdout.write("Jogador $jogadorAtual, linha (0-2): ");
      linha = int.parse(stdin.readLineSync()!);
      stdout.write("Jogador $jogadorAtual, coluna (0-2): ");
      coluna = int.parse(stdin.readLineSync()!);

      if (linha >= 0 && linha <= 2 && coluna >= 0 && coluna <= 2 && tabuleiro[linha][coluna] == ' ') {
        break;
      } else {
        print("Posição inválida! Tente novamente.\n");
      }
    }

    tabuleiro[linha][coluna] = jogadorAtual;

    // Verifica vitória
    if (checaVitoria(tabuleiro, jogadorAtual)) {
      printTabuleiro(tabuleiro);
      print("🎉 Jogador $jogadorAtual venceu!");
      break;
    }

    // Verifica empate
    if (checaEmpate(tabuleiro)) {
      printTabuleiro(tabuleiro);
      print("🤝 Empate!");
      break;
    }

    // Alterna jogador
    jogadorAtual = (jogadorAtual == 'X') ? 'O' : 'X';
  }
}

void printTabuleiro(List<List<String>> t) {
  print("\n  0   1   2");
  for (int i = 0; i < 3; i++) {
    String linha = "";
    for (int j = 0; j < 3; j++) {
      linha += " ${t[i][j]} ";
      if (j < 2) linha += "|";
    }
    print("$i$linha");
    if (i < 2) print(" ---+---+---");
  }
  print('');
}

bool checaVitoria(List<List<String>> t, String j) {
  // Linhas
  for (int i = 0; i < 3; i++) {
    if (t[i][0] == j && t[i][1] == j && t[i][2] == j) return true;
  }
  // Colunas
  for (int i = 0; i < 3; i++) {
    if (t[0][i] == j && t[1][i] == j && t[2][i] == j) return true;
  }
  // Diagonais
  if (t[0][0] == j && t[1][1] == j && t[2][2] == j) return true;
  if (t[0][2] == j && t[1][1] == j && t[2][0] == j) return true;

  return false;
}

bool checaEmpate(List<List<String>> t) {
  for (var linha in t) {
    for (var c in linha) {
      if (c == ' ') return false;
    }
  }
  return true;
}