import 'dart:io';

void main() {
  String matricula;

  double somaTurma = 0;
  int totalAlunos = 0;

  int aprovados = 0;

  double somaFeminino = 0;
  int qtdFeminino = 0;

  double maiorMediaM = -1;
  String melhorMatriculaM = "";

  double maiorMediaF = -1;
  String melhorMatriculaF = "";

  while (true) {
    print("Digite a matrícula (ou 00000 para encerrar):");
    matricula = stdin.readLineSync()!;

    if (matricula == "00000") break;

    print("Nome:");
    String nome = stdin.readLineSync()!;

    print("Sexo (M/F):");
    String sexo = stdin.readLineSync()!.toUpperCase();

    print("Nota 1:");
    double n1 = double.parse(stdin.readLineSync()!);

    print("Nota 2:");
    double n2 = double.parse(stdin.readLineSync()!);

    print("Nota 3:");
    double n3 = double.parse(stdin.readLineSync()!);

    print("Faltas:");
    int faltas = int.parse(stdin.readLineSync()!);

    double media = (n1 + n2 + n3) / 3;

    somaTurma += media;
    totalAlunos++;

    // Feminino
    if (sexo == "F") {
      somaFeminino += media;
      qtdFeminino++;
    }

    // Verifica aprovação
    bool aprovado = (media >= 7) && (faltas <= 18);

    if (aprovado) {
      aprovados++;

      if (sexo == "M" && media > maiorMediaM) {
        maiorMediaM = media;
        melhorMatriculaM = matricula;
      }

      if (sexo == "F" && media > maiorMediaF) {
        maiorMediaF = media;
        melhorMatriculaF = matricula;
      }
    }
  }

  // Resultados
  if (totalAlunos > 0) {
    double mediaTurma = somaTurma / totalAlunos;
    double percentual = (aprovados / totalAlunos) * 100;

    print("\n--- RESULTADOS ---");
    print("Média da turma: $mediaTurma");
    print("Percentual de aprovados: ${percentual.toStringAsFixed(2)}%");

    print("Melhor aluno masculino aprovado: $melhorMatriculaM");
    print("Melhor aluno feminino aprovado: $melhorMatriculaF");

    if (qtdFeminino > 0) {
      double mediaF = somaFeminino / qtdFeminino;
      print("Média das alunas: $mediaF");
    } else {
      print("Nenhuma aluna cadastrada.");
    }
  } else {
    print("Nenhum aluno informado.");
  }
}