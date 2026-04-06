import 'dart:io';

void main() {
  String nome;

  int totalM = 0;
  int totalF = 0;

  int somaIdadeHomensExp = 0;
  int qtdHomensExp = 0;

  int homensMais45 = 0;

  int mulheresMenos30Exp = 0;

  int menorIdadeFExp = 9999;
  String nomeMenorFExp = "";

  while (true) {
    print("Nome (ou FIM para encerrar):");
    nome = stdin.readLineSync()!;

    if (nome.toUpperCase() == "FIM") break;

    print("Sexo (M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();

    print("Idade:");
    int idade = int.parse(stdin.readLineSync()!);

    print("Tem experiência? (S/N):");
    String exp = stdin.readLineSync()!.toUpperCase();

    // a) contagem por sexo
    if (sexo == "M") {
      totalM++;

      // b) homens com experiência
      if (exp == "S") {
        somaIdadeHomensExp += idade;
        qtdHomensExp++;
      }

      // c) homens > 45
      if (idade > 45) {
        homensMais45++;
      }
    }

    if (sexo == "F") {
      totalF++;

      // d) mulheres < 30 com experiência
      if (idade < 30 && exp == "S") {
        mulheresMenos30Exp++;
      }

      // e) mulher mais nova com experiência
      if (exp == "S" && idade < menorIdadeFExp) {
        menorIdadeFExp = idade;
        nomeMenorFExp = nome;
      }
    }
  }

  print("\n=== RESULTADOS ===");

  // a)
  print("Total de homens: $totalM");
  print("Total de mulheres: $totalF");

  // b)
  if (qtdHomensExp > 0) {
    double media = somaIdadeHomensExp / qtdHomensExp;
    print("Média de idade dos homens com experiência: $media");
  } else {
    print("Nenhum homem com experiência.");
  }

  // c)
  if (totalM > 0) {
    double perc = (homensMais45 / totalM) * 100;
    print("Percentual de homens > 45 anos: ${perc.toStringAsFixed(2)}%");
  } else {
    print("Nenhum homem cadastrado.");
  }

  // d)
  print("Mulheres < 30 com experiência: $mulheresMenos30Exp");

  // e)
  if (nomeMenorFExp != "") {
    print("Mulher mais nova com experiência: $nomeMenorFExp");
  } else {
    print("Nenhuma mulher com experiência.");
  }
}