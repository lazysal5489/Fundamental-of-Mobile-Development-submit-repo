import 'package:material_ui/material_ui.dart';

enum Sport {
  football(name: "Football", icon: Icons.sports_soccer, color: Colors.green),
  basketball(
    name: "Basketball",
    icon: Icons.sports_basketball,
    color: Colors.orange,
  ),
  tennis(name: "Tennis", icon: Icons.sports_tennis, color: Colors.purple),
  volleyball(
    name: "Volleyball",
    icon: Icons.sports_volleyball,
    color: Colors.blue,
  ),
  rugby(name: "Rugby", icon: Icons.sports_rugby, color: Colors.brown),
  golf(name: "Golf", icon: Icons.sports_golf, color: Colors.teal);

  const Sport({required this.name, required this.icon, required this.color});

  final String name;
  final IconData icon;
  final Color color;
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "EX-2 - Stateless Widgets",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: const [
            SportCard(sport: Sport.football, isFavorite: true),
            SportCard(sport: Sport.basketball),
            SportCard(sport: Sport.tennis, isFavorite: true),
            SportCard(sport: Sport.volleyball),
            SportCard(sport: Sport.rugby),
            SportCard(sport: Sport.golf, isFavorite: true),
          ],
        ),
      ),
    ),
  );
}

class SportCard extends StatefulWidget {
  const SportCard({super.key, required this.sport, this.isFavorite = false});

  final Sport sport;
  final bool isFavorite;

  @override
  State<SportCard> createState() => _SportCard();
}

class _SportCard extends State<SportCard> {
  late bool _isFavorite = false;

  @override
  void initialState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x22000000),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: widget.sport.color,
              child: Icon(widget.sport.icon, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.sport.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: _isFavorite ? Colors.amber : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
