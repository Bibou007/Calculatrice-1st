import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:calculator1/calculator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.orangeAccent,
        splash: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width*0.5,
              height: 60.0,
            ),
           
            const SizedBox(height: 50.0,),
            const Text(
              'Created By Bibou',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
        splashIconSize: 250,
        duration: 4000,
        nextScreen: const Calculator(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        animationDuration:const Duration(seconds: 1))
        ;
  }
}
