import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Audio Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final player = AudioPlayer();

  Expanded buildKey({required Color color, required int sound}) {
    return Expanded(
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          player.play(AssetSource('note$sound.wav'));
        },
        child: const Text(' '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, sound: 1),
          buildKey(color: Colors.blue, sound: 2),
          buildKey(color: Colors.yellow, sound: 3),
          buildKey(color: Colors.green, sound: 4),
          buildKey(color: Colors.purple, sound: 5),
          buildKey(color: Colors.white, sound: 6),
          buildKey(color: Colors.black, sound: 7),
        ],
      ),
    );
  }
}
