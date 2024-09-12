import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _HomepageState();
}

class _HomepageState extends State<homepage> {
  bool pressed = false;
  bool dark = false;
  final player = AudioPlayer();
  final random = Random();
  // create list to for audio

  final List<String> audiolist = [
    'assets/gawk hard.mp3',
    'assets/gawksoft.mp3',
  ];

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

            // try {
            //   int randomIndex = random.nextInt(audiolist.length);
            //   String ranaudio = audiolist[randomIndex];
            //   player.play(AssetSource(ranaudio));
            // } catch (e) {
            //   print("$e cant be played.");
            // }
            player.play(
              AssetSource(
                'gawkhard.mp3',
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
