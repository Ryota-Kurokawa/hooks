import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main(List<String> args) {
  runApp(todo());
}

class todo extends StatelessWidget {
  const todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
    );
  }
}

class start extends HookWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final _todoList = useState(<String>[]);

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your task",
                  border: OutlineInputBorder(),
                ),
                controller: _controller,
                onSubmitted: (val) {
                  final _list = _todoList.value;
                  _list.add(val);
                  _todoList.value = [..._list];
                  _controller.clear();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _todoList.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_todoList.value[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
