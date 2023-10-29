import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedules/models/User.dart';
import 'package:schedules/provider/users.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome completo",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Obrigatório!";
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Obrigatório!";
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['email'] = value.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Avatar",
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Obrigatório!";
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['avatarUrl'] = value.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      _form.currentState?.save();

                      Provider.of<Users>(context, listen: false).put(
                        User(
                          id: _formData['id'],
                          name: _formData['name']!,
                          email: _formData['email']!,
                          avatarUrl: _formData['avatarUrl']!,
                        ),
                      );

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
