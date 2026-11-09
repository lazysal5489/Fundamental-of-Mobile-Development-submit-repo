import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            children: [
              MyHobbiesCard(
                text: "Travelling",
                icon: Icons.travel_explore_sharp,
              ),
              const SizedBox(
                height: 10,
              ),
              MyHobbiesCard(
                text: "Skating",
                icon: Icons.skateboarding_sharp,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class MyHobbiesCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const MyHobbiesCard(
      {super.key,
      required this.text,
      required this.icon,
      this.color = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        height: 80,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 30),
        child: Text.rich(
          TextSpan(
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
              TextSpan(
                text: text,
              ),
            ],
          ),
        ));
  }
}
