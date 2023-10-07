import 'package:flutter/material.dart';
import 'package:flutter_animation_study/pages/cross_fade_page.dart';
import 'package:flutter_animation_study/pages/my_home_page.dart';
import 'package:flutter_animation_study/pages/padding_animated_page.dart';

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
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        "/crossFade": (_) => const CrossFadePage(),
        "/paddingAnimated": (_) => const PaddingAnimatedPage(),
      },
    );
  }
}

//1. AnimatedContainer
//2. AnimatedDefaultTextStyle
//3. AnimatedCrossFade

//4. AnimatedPadding
//5. AnimatedOpacity