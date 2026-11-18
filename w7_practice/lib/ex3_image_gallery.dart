// EX 3 – The image gallery (handout page: EX 3). Start code from the handout.
// The images are in assets/w4-s2/: declare them in pubspec.yaml yourself.

import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner:
          false, // Why this line ? Can you explain it ? answer: this line is to close the debug banner in our flutter app.
      home: ImageViewer(),
    ));

class ImageViewer extends StatefulWidget {
  ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentImageIndex = 0;

  void setImageIndexNext() {
    setState(() {
      currentImageIndex++;
      if (currentImageIndex == images.length) {
        currentImageIndex = 0;
      }
    });
  }

  void setImageIndexPrev() {
    setState(() {
      currentImageIndex--;
      if (currentImageIndex < 0) {
        currentImageIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => {setImageIndexPrev()},
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => {setImageIndexNext()},
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentImageIndex]),
    );
  }
}
