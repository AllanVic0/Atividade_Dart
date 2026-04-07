import 'dart:math';

// feito com preenchimento de numeros aleatórios para facilitar o teste
List<int> gerarVetorAleatorio(int tamanho, int min, int max) {
  Random rnd = Random();
  List<int> vetor = List.generate(
    tamanho,
    (_) => min + rnd.nextInt(max - min + 1),
  );
  return vetor;
}

List<int> somaVetores(List<int> a, List<int> b) {
  List<int> resultado = [];
  for (int i = 0; i < a.length; i++) {
    resultado.add(a[i] + b[i]);
  }
  return resultado;
}

int somaTotal(List<int> vetor) {
  int soma = 0;
  for (var val in vetor) {
    soma += val;
  }
  return soma;
}

void main() {
  int n = 5; // tamanho dos vetores
  int min = 0; // valor mínimo aleatório
  int max = 10; // valor máximo aleatório

  List<int> vetor1 = gerarVetorAleatorio(n, min, max);
  List<int> vetor2 = gerarVetorAleatorio(n, min, max);

  print("Vetor 1: $vetor1");
  print("Vetor 2: $vetor2");

  List<int> vetor3 = somaVetores(vetor1, vetor2);
  print("Vetor resultante (soma): $vetor3");
  print("Soma de todos os elementos do vetor resultante: ${somaTotal(vetor3)}");
}
