import 'package:expenses/components/card_app.dart';
import 'package:flutter/material.dart';

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
    return Form(
      key: _form,
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
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
