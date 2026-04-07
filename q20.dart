import 'dart:io';

void main() {
  List<List<String>> mapa = [
    ['#','#','#','#','#','#','#','#'],
    ['#','P',' ',' ','#',' ',' ','#'],
    ['#','#',' ','#','#',' ','#','#'],
    ['#',' ',' ',' ',' ',' ',' ','#'],
    ['#',' ','#','#','#','#',' ','#'],
    ['#',' ',' ',' ',' ','#','S','#'],
    ['#','#','#','#','#','#','#','#'],
  ];

  int playerX = 1;
  int playerY = 1;

  while (true) {
    printMapa(mapa);

    print("Use W A S D para mover:");
    String comando = stdin.readLineSync()!.toUpperCase();

    int novoX = playerX;
    int novoY = playerY;

    if (comando == "W") novoX--;
    if (comando == "S") novoX++;
    if (comando == "A") novoY--;
    if (comando == "D") novoY++;

    // Verifica parede
    if (mapa[novoX][novoY] != '#') {

      // Verifica vitória
      if (mapa[novoX][novoY] == 'S') {
        print("🎉 Você venceu!");
        break;
      }

      // Move jogador
      mapa[playerX][playerY] = ' ';
      playerX = novoX;
      playerY = novoY;
      mapa[playerX][playerY] = 'P';
    } else {
      print("🚫 Bateu na parede!");
    }
  }
}

void printMapa(List<List<String>> mapa) {
  print("\nLABIRINTO:");
  for (var linha in mapa) {
    print(linha.join(" "));
  }
}