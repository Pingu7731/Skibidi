import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _HomepageState();
}

class _HomepageState extends State<homepage> {
  bool pressed = true;
  bool dark = true;

  @override
  Widget build(BuildContext context) {
    final backgrouncolor =
        dark ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    double blur = pressed ? 5.0 : 30.0;
    Offset distance = pressed ? const Offset(10, 10) : const Offset(28, 28);

    return Scaffold(
      backgroundColor: backgrouncolor,
      body: Center(
        child: Listener(
          onPointerUp: (_) => setState(() => pressed = false),
          onPointerDown: (_) => setState(() => pressed = true),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
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
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
