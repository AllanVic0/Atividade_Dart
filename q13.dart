import 'dart:io';

void main() {
  final n = _lerInt('Digite o valor de N: ');

  if (n == null || n <= 0) {
    print('Erro: Por favor, insira um número inteiro positivo.');
    return;
  }

  final List<int> vetor = [];
  for (int i = 0; i < n; i++) {
    int? valor;
    while (valor == null) {
      valor = _lerInt('Elemento ${i + 1}: ');
      if (valor == null) {
        print('Valor inválido. Por favor, digite um número inteiro.');
      }
    }
    vetor.add(valor);
  }

  Map<int, int> frequencia = {};
  for (int val in vetor) {
    frequencia[val] = (frequencia[val] ?? 0) + 1;
  }

  print('\nResultado:');
  frequencia.forEach((valor, count) {
    print('$valor – $count');
  });
}

int? _lerInt(String mensagem) {
  stdout.write(mensagem);
  final input = stdin.readLineSync()?.trim() ?? '';
  return int.tryParse(input);
}