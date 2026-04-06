void main() {
  for (int num = 1000; num <= 9999; num++) {
    int parte1 = num ~/ 100; // primeiros 2 dígitos
    int parte2 = num % 100;  // últimos 2 dígitos

    int soma = parte1 + parte2;

    if (soma * soma == num) {
      print(num);
    }
  }
}