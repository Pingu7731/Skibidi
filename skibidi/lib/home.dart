import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  bool pressed = false;
  bool dark = false;
  final player = AudioPlayer();

  // create list to for audio

  final List audiolist = [
    'assets/gawkhard.mp3',
    'assets/gawksoft.mp3',
  ];

//creat a function for getting random audio
  String getRandomAudio() {
    final random = Random();
    int ranIndex = random.nextInt(audiolist.length);
    return audiolist[ranIndex];
  }

  @override
  Widget build(BuildContext context) {
    final backgrouncolor =
        dark ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    double blur = pressed ? 4.0 : 30.0;
    Offset distance = pressed ? const Offset(10, 10) : const Offset(28, 28);

    return Scaffold(
      backgroundColor: backgrouncolor,
      body: Center(
        child: Listener(
          onPointerUp: (_) => setState(() {
            pressed = false;
          }),
          onPointerDown: (_) => setState(() {
            pressed = true;

            player.play(
              AssetSource(
                getRandomAudio(),
              ),
            );
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgrouncolor,
              boxShadow: [
                BoxShadow(
                  offset: -distance,
                  color: dark ? const Color(0xFF35393F) : Colors.white,
                  blurRadius: blur,
                  inset: pressed,
                ),
                BoxShadow(
                  offset: distance,
                  color:
                      dark ? const Color(0xFF23262A) : const Color(0xFFA7A9AF),
                  blurRadius: blur,
                  inset: pressed,
                )
              ],
            ),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  'Skibidi',
                  style: TextStyle(
                    fontSize: pressed ? 29 : 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 194, 194, 194),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
