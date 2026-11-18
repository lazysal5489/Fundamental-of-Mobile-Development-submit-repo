import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            children: [
              SelectButtom(),
              const SizedBox(height: 20),
              SelectButtom(
                isSelected: true,
              ),
              const SizedBox(height: 20),
              SelectButtom(),
              const SizedBox(height: 20),
              SelectButtom(
                isSelected: true,
              ),
            ],
          ),
        ),
      ),
    ));

class SelectButtom extends StatefulWidget {
  final bool isSelected;
  SelectButtom({super.key, this.isSelected = false});

  @override
  State<SelectButtom> createState() => _SelectButtomState();
}

class _SelectButtomState extends State<SelectButtom> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void selectState() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          onPressed: () => {selectState()},
          style: ElevatedButton.styleFrom(
              backgroundColor: _isSelected ? Colors.blue[500] : Colors.blue[50],
              foregroundColor: _isSelected ? Colors.white : Colors.black),
          child: Center(
            child: Text(_isSelected ? "Seleted" : "Note Selected"),
          )),
    );
  }
}
