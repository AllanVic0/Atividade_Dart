import 'dart:io';
import 'dart:math'; // Importado para usar a função pow

void main() {
  int n; // Declara n fora do try-catch para que seja acessível depois
  String? input;

  try {
    // Solicita o número de termos da série
    print('Digite o número de termos da série:');
    input = stdin.readLineSync(); // Lê a entrada do usuário de forma segura
  } on UnsupportedError {
    // Captura o erro quando stdin não está disponível (ex: em ambientes não-CLI)
    print('AVISO: Entrada de usuário interativa não suportada neste ambiente.');
    print('Usando um valor padrão de 5 termos para a série.');
    input = '5'; // Define um valor padrão para simular a entrada
  }

  // Verifica se a entrada é nula ou vazia (ou se o fallback definiu '5')
  if (input == null || input.isEmpty) {
    print('Erro: Entrada inválida. Por favor, digite um número.');
    return; // Encerra o programa se a entrada for inválida e não houver fallback
  }

  try {
    n = int.parse(input); // Tenta converter a entrada para um número inteiro
  } on FormatException {
    print('Erro: Entrada inválida. Por favor, digite um número inteiro válido.');
    return; // Encerra o programa se a conversão falhar
  }

  // Verifica se o número de termos é positivo
  if (n <= 0) {
    print('Erro: O número de termos deve ser um valor positivo.');
    return; // Encerra o programa se n não for positivo
  }

  // Variável para armazenar o total da série
  double total = 0;

  // Inicializa os valores para a base e o expoente
  int base = 3; // A base inicial é 3
  int expoente = 4; // O expoente inicial é 4

  // Loop para calcular a soma ou subtração dos termos
  for (int i = 1; i <= n; i++) {
    // Calcula a base elevada ao expoente.
    // pow retorna um 'num', que pode ser int ou double.
    // Converte para double explicitamente para evitar problemas de tipo na soma.
    double termo = pow(base, expoente).toDouble();

    // Se o índice for ímpar, soma o termo, caso contrário, subtrai
    if (i % 2 != 0) {
      total += termo;
    } else {
      total -= termo;
    }

    // Atualiza os valores para o próximo termo
    base += 2; // A base aumenta de 2 em 2
    expoente += 4; // O expoente aumenta de 4 em 4
  }

  // Imprime o valor total da série
  print('Valor total da série: $total');
}