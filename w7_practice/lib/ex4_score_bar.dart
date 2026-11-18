import 'package:flutter/material.dart';

// EX 4 – Score bar (BONUS, free style: handout page EX 4)
// The design, the widgets and the data are up to you.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ScoreBar(
                    subject: "Flutter",
                  ),
                  const SizedBox(height: 20),
                  ScoreBar(
                    subject: "Dart",
                  ),
                  const SizedBox(height: 20),
                  ScoreBar(
                    subject: "React",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ) // YOUR CODE
          ),
    ),
  );
}

class ScoreBar extends StatefulWidget {
  final String subject;
  ScoreBar({super.key, required this.subject});

  @override
  State<ScoreBar> createState() => _ScoreBar();
}

class _ScoreBar extends State<ScoreBar> {
  double _fill = 0.0;
  final double _sttep = 0.1;

  void _increase() {
    setState(() {
      _fill = (_fill + _sttep).clamp(0.0, 1.0);
    });
  }

  void _discrease() {
    setState(() {
      _fill = (_fill - _sttep).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              'My score in ${widget.subject}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _discrease();
                    },
                    icon: const Icon(Icons.remove)),
                const SizedBox(width: 150),
                IconButton(
                    onPressed: () {
                      _increase();
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _fill,
                  minHeight: 50,
                  backgroundColor: Colors.grey,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
