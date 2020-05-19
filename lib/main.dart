import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetraker/screen/services/auth.dart';

import './screen/landing_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
        child: MaterialApp(
          title: 'Time Tracker',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          home: LandingScreen(),
        ),
    );

  }
}