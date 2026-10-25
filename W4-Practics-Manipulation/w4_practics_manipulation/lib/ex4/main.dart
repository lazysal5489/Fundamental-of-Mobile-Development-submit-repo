import 'package:flutter/material.dart';

class Ex4 extends StatelessWidget {
  const Ex4({super.key});

  @override
  Widget build(BuildContext contect) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(189, 189, 186, 1),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              customCard(
                text: "OOP",
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(141, 205, 255, 1),
                    Color.fromRGBO(141, 205, 255, 1),
                  ],
                ),
              ),
              customCard(
                text: "DART",
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(82, 182, 255, 1),
                    Color.fromRGBO(82, 182, 255, 1),
                  ],
                ),
              ),
              customCard(
                text: "FLUTTER",
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 144, 255, 1),
                    Color.fromRGBO(0, 38, 163, 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class customCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;

  const customCard({super.key, required this.text, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
