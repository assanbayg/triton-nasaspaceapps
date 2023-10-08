import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triton',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 169, 154, 255),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 169, 154, 255)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
