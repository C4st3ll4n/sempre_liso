import 'package:flutter/material.dart';
import 'package:sempreliso/screen/FormPage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Financas> financeiro = [
    Financas(8, "Vendeu app", 600, false),
    Financas(10, "Vendeu mouse", 80.0, false),
    Financas(11, "Compra de Teclado", 175.0, true),
    Financas(13, "Compra de MacBook", 5000.0, true),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("Sempre liso"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            Navigator.push(context,
                MaterialPageRoute(
                  maintainState: true,
                    builder: (BuildContext context) {
              return BlankPage();
            })).then((fin){

              setState(() {
                financeiro.add(fin as Financas);
                print(fin);
                print(financeiro);
              });

            });

            //if(financa != null) financeiro.add(financa);
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: ListaLancamento(financeiro: financeiro,),
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

  @override
  String toString() {
    return 'Financas{id: $id, titulo: $titulo, valor: $valor, isDebito: $isDebito}';
  }


}

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
          return ItemLancamento(financa: fin,);
        });
  }
}

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
            : Icon(Icons.trending_up,color: Colors.blue),
      ),
    );
  }
}


