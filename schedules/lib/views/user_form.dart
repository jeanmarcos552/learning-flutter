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
  final List<String> _fields = ["name", "email", "avatarUrl"];
  final List<String> _fieldsOptional = ["avatarUrl"];
  final Map<String, String> _translate = {
    "name": "Nome Completo",
    "email": "E-mail",
    "avatarUrl": "Avatar"
  };

  void _initFormData(User user) {
    _formData['id'] = user.id.toString();
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ModalRoute.of(context);
    if (user?.settings.arguments != null) {
      _initFormData(user?.settings.arguments as User);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulário")),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                for (var field in _fields)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      initialValue: _formData[field],
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: _translate[field].toString(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (_fieldsOptional.contains(field)) {
                          return null;
                        }

                        if (value == null || value.isEmpty) {
                          return "Obrigatório!";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData[field] = value.toString(),
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
      ),
    );
  }
}
