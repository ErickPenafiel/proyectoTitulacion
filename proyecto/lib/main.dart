import 'package:flutter/material.dart';
import 'autentificacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationPage(title: 'Autentificaion'),
    );
  }
}
