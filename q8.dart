import 'dart:io';

void main() {
  String codigo;

  int total = 0;
  int totalM = 0;
  int totalF = 0;

  // b) menor pontuação masculina
  double menorPontuacaoM = double.infinity;
  String nomeMenorM = "";

  // c) maior pontuação masculina em SI
  double maiorPontuacaoSI = -1;
  String codigoMaiorSI = "";

  print("=== CANDIDATOS CC COM MAIS DE 2500 PONTOS ===");

  while (true) {
    print("\nDigite o código (ou 0000 para encerrar):");
    codigo = stdin.readLineSync()!;

    if (codigo == "0000") break;

    print("Curso (CC/SI):");
    String curso = stdin.readLineSync()!.toUpperCase();

    print("Nome:");
    String nome = stdin.readLineSync()!;

    print("Sexo (M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();

    print("Pontuação:");
    double pontos = double.parse(stdin.readLineSync()!);

    total++;

    // Contagem por sexo
    if (sexo == "M") {
      totalM++;

      // b) menor pontuação masculina
      if (pontos < menorPontuacaoM) {
        menorPontuacaoM = pontos;
        nomeMenorM = nome;
      }

      // c) maior pontuação masculina em SI
      if (curso == "SI" && pontos > maiorPontuacaoSI) {
        maiorPontuacaoSI = pontos;
        codigoMaiorSI = codigo;
      }

    } else if (sexo == "F") {
      totalF++;
    }

    // a) CC com mais de 2500 pontos
    if (curso == "CC" && pontos > 2500) {
      print("Código: $codigo | Nome: $nome | Pontos: $pontos");
    }
  }

  print("\n=== RESULTADOS ===");

  if (total > 0) {
    // b)
    if (nomeMenorM != "") {
      print("Homem com menor pontuação: $nomeMenorM");
    } else {
      print("Nenhum candidato masculino.");
    }

    // c)
    if (codigoMaiorSI != "") {
      print("Código do homem com maior pontuação em SI: $codigoMaiorSI");
    } else {
      print("Nenhum homem no curso SI.");
    }

    // d)
    double percM = (totalM / total) * 100;
    double percF = (totalF / total) * 100;

    print("Percentual Masculino: ${percM.toStringAsFixed(2)}%");
    print("Percentual Feminino: ${percF.toStringAsFixed(2)}%");
  } else {
    print("Nenhum candidato informado.");
  }
}