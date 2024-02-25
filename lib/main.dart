import 'package:dio/dio.dart';
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
  var _pokemonPicFront =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png';

  Future<void> fetchPokemon(String searchNum) async {
    searchNum = searchNum.isEmpty ? '1' : searchNum;
    Response res =
        await Dio().get('https://pokeapi.co/api/v2/pokemon/${searchNum}/');
    // print(res.data);
    print(res.data['name']);
    print(res.data['forms'][0]['url']);
    Response res2 = await Dio().get(res.data['forms'][0]['url']);
    print(res2.data['sprites']['front_default']);
    _pokemonPicFront = res2.data['sprites']['front_default'];

    // 画面を更新する
    setState(() {});
  }

  //画面が表示された時に呼ばれる
  @override
  void initState() {
    super.initState();
    // 画像を取得する処理を呼び出す
    fetchPokemon('1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
            // 入力フォームの背景色
            fillColor: Colors.white,
            // 入力フォームの背景色を変更するためのプロパティ
            filled: true,
            // 入力フォームのヒントメッセージ
            hintText: 'SearchNumPokemon',
          ),
          // キーボードのエンターキーを押した時の処理
          onFieldSubmitted: (String value) {
            // 画像を取得する処理を呼び出す
            fetchPokemon(value);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(_pokemonPicFront),
          ],
        ),
      ),
    );
  }
}
