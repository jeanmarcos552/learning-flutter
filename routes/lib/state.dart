import 'package:flutter/material.dart';

class PageState extends StatefulWidget {
  const PageState({super.key});

  @override
  State<PageState> createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {
  final List<int> _listPessoas = [1,2,3,4,5,6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Page Home'),
      ),
      body: ListView.builder(
        itemCount: _listPessoas.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_listPessoas[index].toString()));
        },
      ),
      bottomSheet:ElevatedButton(
        onPressed: () {
          setState(() {
            _listPessoas.add(_listPessoas.length + 1);
          });
        },
        child: const Text("add"),
      ),
    );
  }
}
