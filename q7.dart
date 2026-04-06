import 'dart:io';
import 'dart:math';

int fatorial(int n) {
  int fat = 1;
  for (int i = 1; i <= n; i++) {
    fat *= i;
  }
  return fat;
}

void main() {
  print("Digite o valor de X:");
  double x = double.parse(stdin.readLineSync()!);

  print("Digite o número de termos:");
  int n = int.parse(stdin.readLineSync()!);

  double soma = 0;

  for (int i = 1; i <= n; i++) {
    double termo = pow(x, i + 1) / fatorial(i);
    soma += termo;
  }

  print("Resultado da série: $soma");
}