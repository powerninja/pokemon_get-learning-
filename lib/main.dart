import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  final _randomId = math.Random().nextInt(151).toString();
  var _pokemonName = '';
  var _pokemonPicFront =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png';

  Future<void> fetchPokemon() async {
    Response res = await Dio()
        .get('https://pokeapi.co/api/v2/pokemon-species/$_randomId/');

    for (var item in res.data['names']) {
      item['language']['name'] == 'ja-Hrkt'
          ? _pokemonName = item['name']
          : null;
    }

    _pokemonPicFront =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$_randomId.png';

    // 画面を更新する
    setState(() {});
  }

  //画面が表示された時に呼ばれる
  @override
  void initState() {
    super.initState();
    // 画像を取得する処理を呼び出す
    fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No: $_randomId $_pokemonName'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(_pokemonPicFront),
            Text(
                '総合運： 今日のあなたは、自分の能力を最大限に発揮することができるでしょう。しかし、その力をどのように使うかは慎重に考える必要があります。力は責任を伴うため、自分の行動が他人にどのような影響を与えるかを常に意識してください。'),
          ],
        ),
      ),
    );
  }
}
