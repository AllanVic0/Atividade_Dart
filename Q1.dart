void main() {
  // Mapa de preços dos bolos
  const boloPrecos = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};

  // Ordem de bolos
  const ordem = ['ovos', 'chocolate'];

  // Função para calcular o total
  double calcularTotal(List<String> pedido) {
    double total = 0;

    // Itera sobre cada item do pedido
    for (var bolo in pedido) {
      // Verifica se o bolo está no cardápio
      if (boloPrecos.containsKey(bolo)) {
        total += boloPrecos[bolo]!;
      } else {
        // Caso o bolo não esteja no cardápio, imprime a mensagem
        print('$bolo não está no cardápio');
      }
    }

    return total;
  }

  // Calcula o total do pedido
  double total = calcularTotal(ordem);

  // Imprime o total, caso tenha calculado algum valor
  if (total > 0) {
    print('Total = $total');
  }
}