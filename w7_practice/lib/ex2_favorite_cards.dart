import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(),
            const Divider(
              height: 1,
            ),
            FavoriteCard(),
            const Divider(
              height: 1,
            ),
            FavoriteCard(),
            const Divider(
              height: 1,
            ),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    void setFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'descriptions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () => {setFavorite()},
            icon: isFavorite
                ? Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_border_sharp),
          )
        ],
      ),
    );
  }
}
