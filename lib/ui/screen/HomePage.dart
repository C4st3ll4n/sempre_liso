import 'package:flutter/material.dart';
import 'package:sempreliso/model/Financa.dart';
import 'package:sempreliso/ui/screen/FormPage.dart';
import 'package:sempreliso/ui/widget/ListaLancamento.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  List<Financas> financeiro = [
    Financas(8, "Vendeu app", 600, false),
    Financas(10, "Vendeu mouse", 80.0, false),
    Financas(11, "Compra de Teclado", 175.0, true),
    Financas(13, "Compra de MacBook", 5000.0, true),
  ];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sempre liso"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cadastrarLancamento(context);
          //if(financa != null) financeiro.add(financa);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListaLancamento(
          financeiro: widget.financeiro,
        ),
      ),
    );
  }

  void _cadastrarLancamento(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            maintainState: true,
            builder: (BuildContext context) {
              return BlankPage();
            })).then((fin) {
              return _atualiza(fin);
            });
  }

  void _atualiza(fin) {
    if (fin != null) {
      setState(() {
        widget.financeiro.add(fin as Financas);
      });
    }
  }
}