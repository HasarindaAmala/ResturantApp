

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fetures/SplashScreen/ui/SplashScreen.dart';

void main(){
  runApp(FoodOrderingApp());
}

class FoodOrderingApp extends StatefulWidget {
  const FoodOrderingApp({super.key});

  @override
  State<FoodOrderingApp> createState() => _FoodOrderingAppState();
}

class _FoodOrderingAppState extends State<FoodOrderingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
