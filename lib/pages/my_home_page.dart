import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double iconSize = 30;
  double containerSize = 150;
  double borderRadius = 20;
  Color color = Colors.blue;

  void _incrementCounter() {
    setState(() {
      _counter++;
      iconSize += 5;
      containerSize = containerSize == 150 ? 300 : 150;
      borderRadius = borderRadius == 200 ? 0 : 200;
      color = color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/crossFade");
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              height: containerSize,
              width: containerSize,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
              child: Center(
                child: AnimatedCrossFade(
                  duration: const Duration(seconds: 2),
                  crossFadeState: _counter % 2 == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Icon(
                    Icons.headphones,
                    size: iconSize + 10,
                  ),
                  secondChild: Icon(
                    Icons.verified_user_outlined,
                    size: iconSize + 10,
                  ),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: const Text("You have pushed the button this many times:"),
              duration: const Duration(seconds: 2),
              style: TextStyle(
                fontSize: _counter % 2 == 0 ? 20 : 30,
                color: color,
                fontWeight:
                    _counter % 2 == 0 ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
