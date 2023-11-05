import 'package:expenses/components/card_app.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final Transactions serviveTransaction = Provider.of(context, listen: false);

    return Form(
      key: _form,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CardApp(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: <Widget>[
              TextFormField(
                onSaved: (value) => _formData['name'] = value.toString(),
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  label: const Text("Descrição:"),
                  labelStyle: TextStyle(
                    color: Colors.purple[400],
                  ),
                ),
              ),
              TextFormField(
                onSaved: (value) => _formData['value'] = value.toString(),
                initialValue: _formData['value'],
                decoration: InputDecoration(
                  label: const Text("Valor R\$:"),
                  labelStyle: TextStyle(color: Colors.purple[400]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _form.currentState?.save();
                        serviveTransaction.put(
                          Transaction(
                            date: DateTime.now(),
                            id: serviveTransaction.lastId() + 1,
                            name: _formData['name'].toString(),
                            value: double.parse(_formData['value'].toString()),
                          ),
                        );
                        _form.currentState?.reset();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
