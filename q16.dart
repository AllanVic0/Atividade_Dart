import 'dart:io';

int _lerInteiro(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? entrada = stdin.readLineSync();
    int? valor = int.tryParse(entrada?.trim() ?? '');
    if (valor != null) return valor;
    print('Entrada inválida. Por favor, digite um número inteiro.');
  }
}

List<int> lerVetor(int idx) {
  print('\n--- Vetor $idx ---');
  int tam = _lerInteiro('Tamanho do Vetor: ');
  List<int> v = [];
  print('Digite os elementos:');
  for (int i = 0; i < tam; i++) {
    v.add(_lerInteiro('  [${i + 1}]: '));
  }
  return v;
}

void main() {
  List<List<int>> vetores = [];
  for (int i = 1; i <= 4; i++) {
    vetores.add(lerVetor(i));
  }

  // a) Quinto vetor com todos os valores ordenados
  List<int> quinto = vetores.expand((v) => v).toList();
  quinto.sort();

  print('\na) Vetor ordenado com todos os valores:');
  print(quinto.join(', '));

  // b) Interseção dos 4 vetores (elementos presentes em todos)
  Set<int> intersecao = vetores[0].toSet();
  for (int i = 1; i < 4; i++) {
    intersecao = intersecao.intersection(vetores[i].toSet());
  }

  List<int> intersecaoOrdenada = intersecao.toList()..sort();

  print('\nb) Elementos em interseção nos 4 vetores:');
  if (intersecaoOrdenada.isEmpty) {
    print('Nenhum elemento em comum nos 4 vetores.');
  } else {
    print(intersecaoOrdenada.join(', '));
  }
}