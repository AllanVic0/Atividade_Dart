import 'dart:io';

class Professor {
  final String codigo;
  final String nome;
  final String sexo;
  final double bruto;
  final double liquido;

  Professor({
    required this.codigo,
    required this.nome,
    required this.sexo,
    required this.bruto,
    required this.liquido,
  });
}

void main() {
  List<Professor> professores = [];
  double totalLiquidoH = 0, totalLiquidoM = 0;
  int countH = 0, countM = 0;

  while (true) {
    stdout.write('Código (9999 para encerrar): ');
    String codigo = stdin.readLineSync()?.trim() ?? '';
    if (codigo == '9999') break;

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()?.trim() ?? '';

    String sexo = '';
    while (sexo != 'M' && sexo != 'F') {
      stdout.write('Sexo (M/F): ');
      sexo = (stdin.readLineSync()?.trim() ?? '').toUpperCase();
    }

    stdout.write('Horas de aula no mês: ');
    int horas = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;

    const valorHora = 12.30;
    final double bruto = horas * valorHora;
    final double taxaDesconto = (sexo == 'M') ? 0.10 : 0.05;
    final double liquido = bruto * (1 - taxaDesconto);

    professores.add(Professor(
      codigo: codigo,
      nome: nome,
      sexo: sexo,
      bruto: bruto,
      liquido: liquido,
    ));

    if (sexo == 'M') {
      totalLiquidoH += liquido;
      countH++;
    } else {
      totalLiquidoM += liquido;
      countM++;
    }
  }

  print('\n${"Código".padRight(10)} '
      '${"Nome".padRight(20)} '
      '${"Sal. Bruto".padLeft(12)} '
      '${"Sal. Líquido".padLeft(13)}');
  print('-' * 65);

  for (var p in professores) {
    print(
      '${p.codigo.padRight(10)} '
      '${p.nome.padRight(20)} '
      'R\$ ${p.bruto.toStringAsFixed(2).padLeft(10)} '
      'R\$ ${p.liquido.toStringAsFixed(2).padLeft(10)}',
    );
  }

  print('\n--- Médias dos Salários Líquidos ---');
  if (countH > 0)
    print('Homens:   R\$ ${(totalLiquidoH / countH).toStringAsFixed(2)}');
  else
    print('Nenhum professor do sexo masculino.');

  if (countM > 0)
    print('Mulheres: R\$ ${(totalLiquidoM / countM).toStringAsFixed(2)}');
  else
    print('Nenhuma professora do sexo feminino.');
}