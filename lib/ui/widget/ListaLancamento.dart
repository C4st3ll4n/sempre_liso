import 'package:flutter/material.dart';
import 'package:sempreliso/model/Financa.dart';
import 'package:sempreliso/ui/widget/ItemLancamento.dart';

class ListaLancamento extends StatefulWidget {
  final List<Financas> financeiro;

  const ListaLancamento({Key key, this.financeiro}) : super(key: key);

  @override
  _ListaLancamentoState createState() => _ListaLancamentoState();
}

class _ListaLancamentoState extends State<ListaLancamento> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.financeiro.length,
        itemBuilder: (ctx, index) {
          Financas fin = widget.financeiro[index];
          return ItemLancamento(
            financa: fin,
          );
        });
  }
}
