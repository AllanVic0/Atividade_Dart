import 'dart:io';
import 'dart:math';

void main() {
  print("Digite o número de termos:");
  int n = int.parse(stdin.readLineSync()!);

  double soma = 0;

  int base = 3;
  int expoente = 4;
  int denominador = 5;

  for (int i = 1; i <= n; i++) {
    double termo = pow(base, expoente) / denominador;

    // regra de sinal (negativo a partir do 4º termo e alternando)
    if (i >= 4 && i % 2 == 0) {
      termo *= -1;
    }

    soma += termo;

    base += 2;
    expoente += 4;
    denominador += 5;
  }

  print("Soma da série: $soma");
}
