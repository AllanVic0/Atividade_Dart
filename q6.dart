import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numero = random.nextInt(100) + 1;

  int min = 1;
  int max = 100;

  print("Adivinhe o número entre 1 e 100!");

  while (true) {
    print("Digite um número:");
    int chute = int.parse(stdin.readLineSync()!);

    if (chute == numero) {
      print("Acertou!");
      break;
    } else if (chute > numero) {
      max = chute;
    } else {
      min = chute;
    }

    print("O número está entre $min e $max");
  }
}