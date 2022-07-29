import 'package:flutter/material.dart';

class Name_Screen extends StatelessWidget {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home:
        Scaffold(
          body:
          Column(children: [

          TextField(controller: _inputController),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _inputController,
            builder: (context, value, child) {
              return ElevatedButton(
                onPressed: value.text.isNotEmpty ? () {} : null,
                child: Text('I am disabled when text is empty'),
              );
            },
          ),
    ]),
        ),
      );
  }
}
