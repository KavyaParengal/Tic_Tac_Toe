import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/homepage.dart';
import 'package:tic_tac_toe/screens/welcomepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    )
  );
}
