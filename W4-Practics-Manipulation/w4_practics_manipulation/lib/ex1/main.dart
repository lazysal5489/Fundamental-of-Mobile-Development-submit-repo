import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Ex1()));
}

class Ex1 extends StatefulWidget {
  const Ex1({Key? key}) : super(key: key);

  @override
  _Ex1State createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello my name is Ronan!",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 36, // Not put fontSize to 50 because it to big for my emulator screen
          ),
        ),
      ),
    );
  }
}
