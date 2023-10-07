import 'package:flutter/material.dart';

class PaddingAnimatedPage extends StatefulWidget {
  const PaddingAnimatedPage({super.key});

  @override
  State<PaddingAnimatedPage> createState() => _PaddingAnimatedPageState();
}

class _PaddingAnimatedPageState extends State<PaddingAnimatedPage> {
  double padding = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PaddingAnimatedPage")),
      body: Center(
        child: Column(
          children: [
            AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(padding),
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.sync),
        onPressed: () {
          setState(() {
            padding = padding == 20 ? 100 : 20;
          });
        },
      ),
    );
  }
}
