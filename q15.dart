import 'dart:io';

int _lerInteiro(String mensagem) {
  while (true) {
    stdout.write(mensagem);
    String? entrada = stdin.readLineSync();
    if (entrada == null) exit(0);
    
    int? valor = int.tryParse(entrada.trim());
    if (valor != null) return valor;
    
    print('Entrada inválida! Por favor, digite um número inteiro.');
  }
}

List<int> lerVetor(String nome) {
  int tam = _lerInteiro('Tamanho do $nome: ');
  List<int> v = [];
  print('Digite os elementos do $nome (já ordenados):');
  for (int i = 0; i < tam; i++) {
    v.add(_lerInteiro('  Elemento ${i + 1}: '));
  }
  v.sort(); 
  return v;
}

List<int> mergeOrdenado(List<int> a, List<int> b) {
  List<int> resultado = [];
  int i = 0, j = 0;
  while (i < a.length && j < b.length) {
    if (a[i] <= b[j]) {
      resultado.add(a[i++]);
    } else {
      resultado.add(b[j++]);
    }
  }
  while (i < a.length) resultado.add(a[i++]);
  while (j < b.length) resultado.add(b[j++]);
  return resultado;
}

void main() {
  List<int> v1 = lerVetor('Vetor 1');
  List<int> v2 = lerVetor('Vetor 2');

  List<int> v3 = mergeOrdenado(v1, v2);

  print('\nVetor resultante ordenado:');
  print(v3.join(', '));
}