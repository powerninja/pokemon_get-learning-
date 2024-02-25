import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PokemonIllustrated(),
    );
  }
}

class PokemonIllustrated extends StatefulWidget {
  const PokemonIllustrated({super.key});

  @override
  State<PokemonIllustrated> createState() => _PokemonIllustratedState();
}

class _PokemonIllustratedState extends State<PokemonIllustrated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
