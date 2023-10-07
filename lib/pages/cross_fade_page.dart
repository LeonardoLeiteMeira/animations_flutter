import 'package:flutter/material.dart';

class CrossFadePage extends StatefulWidget {
  const CrossFadePage({super.key});

  @override
  State<CrossFadePage> createState() => _CrossFadePageState();
}

class _CrossFadePageState extends State<CrossFadePage> {
  final width = 500.0;
  final height = 100.0;

  final width2 = 300.0;
  final height2 = 200.0;

  int change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CrossFadePage"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/paddingAnimated");
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.black,
            ),
            AnimatedCrossFade(
              firstCurve: Curves.linear,
              secondCurve: Curves.easeInCubic,
              sizeCurve: Curves.easeInQuad,
              duration: const Duration(seconds: 1),
              firstChild: childOne(),
              secondChild: childTwo(),
              crossFadeState: change == 0
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.black,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.sync),
        onPressed: () {
          setState(() {
            change = change == 0 ? 1 : 0;
          });
        },
      ),
    );
  }

  Widget childOne() => Container(
        width: width,
        height: height,
        color: Colors.red,
        child: const Center(
            child: Text(
          "First",
          style: TextStyle(fontSize: 35),
        )),
      );

  Widget childTwo() => Container(
        width: width2,
        height: height2,
        color: Colors.blue,
        child: const Center(
            child: Text(
          "Second",
          style: TextStyle(fontSize: 35),
        )),
      );
}
