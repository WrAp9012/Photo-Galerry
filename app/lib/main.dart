import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo gallery",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: const _appBar(),
        body: const setImageWidget(),
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}

class setImageWidget extends StatefulWidget {
  const setImageWidget({super.key});

  @override
  _body createState() => _body();
}

class _body extends State<setImageWidget> {
  int currentImg = 0;
  static const List imgPath = [
    "obraz1.jpg",
    "obraz2.jpg",
    "obraz3.jpg",
    "obraz4.jpg",
    "obraz5.jpg",
    "obraz6.jpg",
  ];

  void nextImg() {
    setState(() {
      currentImg = (currentImg + 1) % imgPath.length;
    });
  }

  void prevoiusImg() {
    setState(() {
      currentImg = currentImg == 0 ? imgPath.length - 1 : currentImg - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Column(
        children: [
          const Text(
            "📷 Galeria Zdjęć",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/${imgPath[currentImg]}",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: prevoiusImg,
                icon: const Icon(Icons.chevron_left),
                label: const Text("Poprzednie"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: nextImg,
                icon: const Icon(Icons.chevron_right),
                label: const Text("Następne"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _appBar extends StatelessWidget implements PreferredSizeWidget {
  const _appBar({super.key});
  final double sizeAppBar = 60.0;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Photo gallery"),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 4,
    );
  }
}
