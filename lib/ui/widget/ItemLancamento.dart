import 'package:flutter/material.dart';
import 'package:sempreliso/model/Financa.dart';

class ItemLancamento extends StatefulWidget {
  final Financas financa;

  const ItemLancamento({Key key, this.financa}) : super(key: key);

  @override
  _ItemLancamentoState createState() => _ItemLancamentoState();
}

class _ItemLancamentoState extends State<ItemLancamento> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.financa.titulo),
        subtitle: Text("R\$${widget.financa.valor}"),
        leading: widget.financa.isDebito
            ? Icon(Icons.trending_down, color: Colors.red)
            : Icon(Icons.trending_up, color: Colors.blue),
      ),
    );
  }
}
