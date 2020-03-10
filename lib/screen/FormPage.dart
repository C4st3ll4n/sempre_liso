import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlankPage extends StatefulWidget {
  @override
  _BlankPageState createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  TextEditingController _controllerTitulo;
  TextEditingController _controllerValor;
  bool isCredito = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerTitulo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hasFloatingPlaceholder: true,
                    hintText: "Insira um títlo",
                    alignLabelWithHint: true,
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
                    prefixText: "R\$ ",
                    border: OutlineInputBorder(),
                    hasFloatingPlaceholder: true,
                    hintText: "Insira um valor",
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
                    print(isCredito);
                  });
                }),

            SizedBox(height: 30,),

            DropdownButton(
              hint: Text("Oi"),
                items: [
                  DropdownMenuItem(child: Text("OI"),)
                ], onChanged: null
            )
          ],
        ),
      ),
    );
  }
}
