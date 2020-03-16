class Financas {
  int id;
  String titulo;
  double valor;
  bool isDebito;

  Financas(this.id, this.titulo, this.valor, this.isDebito);

  @override
  String toString() {
    return 'Financas{id: $id, titulo: $titulo, valor: $valor, isDebito: $isDebito}';
  }
}
