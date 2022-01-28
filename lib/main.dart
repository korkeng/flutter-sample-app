import 'package:flutter/material.dart';
import 'package:sample_app/assets/constants/image_path.dart';
import 'package:sample_app/src/components/menu_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Air Conditioning Curcuit'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            iconSize: 36,
            icon: const Icon(Icons.account_circle_outlined),
            // ignore: avoid_returning_null_for_void
            onPressed: () => null,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              iconSize: 36,
              onPressed: () => null,
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              MenuCard(
                image: ImagePath.catTransparent,
                text: 'แบบทดสอบก่อนเรียน',
              ),
              const SizedBox(height: 24),
              MenuCard(
                image: ImagePath.cat,
                text: 'ใบความรู้',
                colors: Colors.blue.shade400,
              ),
              const SizedBox(height: 24),
              MenuCard(
                image: ImagePath.parrot,
                text: 'การทดลอง',
                colors: Colors.pink.shade400,
              ),
              const SizedBox(height: 24),
              MenuCard(
                image: ImagePath.cat,
                text: 'แบบทดสอบหลังเรียน',
              ),
              const SizedBox(height: 24),
              MenuCard(
                image: ImagePath.parrot,
                text: 'แบบประเมินความพึงพอใจ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
