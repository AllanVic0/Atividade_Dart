import 'dart:io';

void main() {
  print("Digite o número de termos:");
  int n = int.parse(stdin.readLineSync()!);

  int a = 1; // potência de 2
  int b = 5; // múltiplos de 5
  int c = 100; // decrescente

  for (int i = 1; i <= n; i++) {
    if (i % 3 == 1) {
      print(a);
      a *= 2;
    } else if (i % 3 == 2) {
      print(b);
      b += 5;
    } else {
      print(c);
      c -= 10;
    }
  }
}
