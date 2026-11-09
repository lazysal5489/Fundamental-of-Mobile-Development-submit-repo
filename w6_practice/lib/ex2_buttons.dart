import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomButton(
                  label: "Submit",
                  icon: Icons.check,
                  possition: IconPossitions.end),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                label: "Time",
                icon: Icons.lock_clock,
                possition: IconPossitions.end,
                color: Colors.green,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                label: "Account",
                icon: Icons.account_balance_wallet_sharp,
                possition: IconPossitions.end,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

enum IconPossitions { start, end }

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final IconData icon;
  final IconPossitions possition;
  final double spacing;
  const CustomButton(
      {super.key,
      required this.label,
      required this.icon,
      this.color = Colors.blue,
      this.spacing = 8,
      this.possition = IconPossitions.start});

  @override
  Widget build(BuildContext context) {
    final iconSpan = WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: EdgeInsets.only(
          right: possition == IconPossitions.start ? spacing : 0,
          left: possition == IconPossitions.end ? spacing : 0,
        ),
        child: Icon(
          icon,
          color: Colors.grey,
          size: 16,
        ),
      ),
    );

    final textSpan = TextSpan(text: label);

    return Container(
      height: 30,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            children: possition == IconPossitions.start
                ? [iconSpan, textSpan]
                : [textSpan, iconSpan]),
      ),
    );
  }
}
