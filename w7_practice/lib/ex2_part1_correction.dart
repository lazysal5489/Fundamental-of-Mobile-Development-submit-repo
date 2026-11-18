// EX 2, Part 1 correction (given in the handout). Look at it AFTER you tried Part 1.
// Not used by main.dart. Parts 2 and 3 go in ex2_favorite_cards.dart.

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
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description')
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
