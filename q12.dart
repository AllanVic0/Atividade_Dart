import 'dart:io';

void main() {
  stdout.write('Digite um número: ');
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    print('Erro: Nenhuma entrada válida fornecida.');
    return;
  }

  String numero = input.trim();

  
  String sinal = '';
  if (numero.startsWith('-')) {
    sinal = '-';
    numero = numero.substring(1);
  }

  
  String invertido = numero.split('').reversed.join();
  
  invertido = invertido.replaceFirst(RegExp(r'^0+'), '');
  if (invertido.isEmpty) invertido = '0';

  print('Número invertido: $sinal$invertido');
}