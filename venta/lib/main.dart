import 'package:flutter/material.dart';
import 'package:venta/screens/home_screen.dart';
import 'package:venta/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
      },
      initialRoute: 'login',
    );
  }
}
