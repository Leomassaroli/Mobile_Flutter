double calcularDesconto(double valor, double desconto, bool percentual){
  if (valor <= 0) {
    throw ArgumentError("O valor do produto não pode ser 0");
  }
  if (desconto <= 0) {
    throw ArgumentError("o valor do desconto não pode ser 0");
  }
  if (percentual) {
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}