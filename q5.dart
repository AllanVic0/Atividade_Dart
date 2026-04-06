import 'dart:io';

void main() {
  int baixo = 0, normal = 0, alto = 0, total = 0;

  double maiorPesoF = -1;
  String nomeMaiorF = "";

  while (true) {
    print("Nome (ou FIM para encerrar):");
    String nome = stdin.readLineSync()!;

    if (nome.toUpperCase() == "FIM") break;

    print("Sexo (M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();

    print("Peso (kg):");
    double peso = double.parse(stdin.readLineSync()!);

    String classificacao;

    if (peso <= 2) {
      classificacao = "Baixo Peso";
      baixo++;
    } else if (peso <= 4) {
      classificacao = "Normal";
      normal++;
    } else {
      classificacao = "Alto Peso";
      alto++;
    }

    print("Nome: $nome | Sexo: $sexo | Classificação: $classificacao");

    // Maior peso feminino
    if (sexo == "F" && peso > maiorPesoF) {
      maiorPesoF = peso;
      nomeMaiorF = nome;
    }

    total++;
  }

  print("\n--- RESULTADOS ---");

  if (total > 0) {
    print("Maior peso feminino: $nomeMaiorF");

    print("Percentual Baixo Peso: ${(baixo / total * 100).toStringAsFixed(2)}%");
    print("Percentual Normal: ${(normal / total * 100).toStringAsFixed(2)}%");
    print("Percentual Alto Peso: ${(alto / total * 100).toStringAsFixed(2)}%");
  } else {
    print("Nenhum dado informado.");
  }
}