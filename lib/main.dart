import 'package:flutter/material.dart';
import 'package:library_management/screens/splash_page.dart';

void main() {
  runApp(LibraryManagement());
}

class LibraryManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//SplashScreen(),