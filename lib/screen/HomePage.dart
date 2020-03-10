import 'package:flutter/material.dart';
import 'package:sempreliso/screen/FormPage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<Financas> financeiro = [
      Financas(8, "Vendeu app", 600, false),
      Financas(10, "Vendeu mouse", 80.0, false),
      Financas(11, "Compra de Teclado", 175.0, true),
      Financas(12, "Compra de MacBook", 5000.0, true),
      Financas(16, "Compra de MacBook", 5000.0, true),
      Financas(15, "Compra de MacBook", 5000.0, true),
      Financas(14, "Compra de MacBook", 5000.0, true),
      Financas(13, "Compra de MacBook", 5000.0, true),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sempre liso"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return BlankPage();
            }));
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: ListaLancamento(financeiro: financeiro,),
        ),
      ),
    );
  }
}

class Financas {
  int id;
  String titulo;
  double valor;
  bool isDebito;

  Financas(this.id, this.titulo, this.valor, this.isDebito);
}

class ListaLancamento extends StatelessWidget {
  final List<Financas> financeiro;

  const ListaLancamento({Key key, this.financeiro}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: financeiro.length,
        itemBuilder: (ctx, index) {
          Financas fin = financeiro[index];
          return ItemLancamento(financa: fin,);
        });
  }
}

class ItemLancamento extends StatelessWidget {
  final Financas financa;

  const ItemLancamento({Key key, this.financa}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(financa.titulo),
        subtitle: Text("R\$${financa.valor}"),
        leading: financa.isDebito
            ? Icon(Icons.trending_down, color: Colors.red)
            : Icon(Icons.trending_up,color: Colors.blue),
      ),
    );
  }
}


