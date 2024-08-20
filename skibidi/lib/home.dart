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

            // player.play(
            //   UrlSource(
            //     'https://cdn.discordapp.com/attachments/848828454753140746/1274181680005120000/diamehdog.mp3?ex=66c151a9&is=66c00029&hm=b9d8ec42f010fb2505dbc3e709691be115f54e234acea42d52abddd24aa3a2c6&',
            //   ),
            // );
            // player.play(
            //   AssetSource(
            //     'gawksoft.mp3',
            //   ),
            // );
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
