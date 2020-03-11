import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sempreliso/screen/HomePage.dart';

class BlankPage extends StatefulWidget {
  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerValor = TextEditingController();
  bool isCredito = false;

  SnackBar snackbar = SnackBar(
    content: Text("Hello"),
  );

  @override
  Widget build(BuildContext context) {
    IconData icone = isCredito ? Icons.trending_up : Icons.trending_down;

    String checkBoxText = !isCredito
        ? "Este lançamento é um débito"
        : "Este lançamento é um crédito";

    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar item"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerTitulo,
                  decoration: InputDecoration(
                      icon: Icon(Icons.short_text),
                      border: OutlineInputBorder(),
                      hasFloatingPlaceholder: true,
                      hintText: "Insira um títlo",
                      alignLabelWithHint: true,
                      labelText: "Título",
                      helperText: "Exemplo: Compra de um notebook"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllerValor,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      prefixText: "R\$ ",
                      border: OutlineInputBorder(),
                      hasFloatingPlaceholder: true,
                      hintText: "Insira um valor",
                      labelText: "Valor",
                      alignLabelWithHint: true,
                      helperText: "Exemplo: R\$200"),
                ),
              ),
              CheckboxListTile(
                  selected: isCredito,
                  activeColor: Colors.lightGreen,
                  secondary: Icon(icone),
                  checkColor: Colors.white,
                  title: Text("$checkBoxText"),
                  value: isCredito,
                  onChanged: (newValue) {
                    setState(() {
                      isCredito = newValue;
                    });
                  }),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                child: Icon(Icons.save),
                onPressed: inserirFinanca,
              )

              /*DropdownButton(
                hint: Text("Oi"),
                  items: [
                    DropdownMenuItem(child: Text("OI"),)
                  ], onChanged: null
              )*/
            ],
          ),
        ),
      ),
    );
  }

  void inserirFinanca() {
    String titulo = _controllerTitulo.text.trim();
    double valor = double.parse(_controllerValor.value.text);
    Financas f = Financas(15, titulo, valor, !isCredito);
    //print("$f");

    Navigator.pop(context, f);
  }
}
