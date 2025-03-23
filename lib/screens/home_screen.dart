import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/character_provider.dart';
import '../models/character.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CharacterProvider>(context, listen: false).fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);

    if (characterProvider.isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (characterProvider.characters.isEmpty && !characterProvider.isLoading) {
      return Scaffold(
        body: Center(
          child: Text("No se pudieron cargar los personajes."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes de Rick and Morty'),
      ),
      body: ListView.builder(
        itemCount: characterProvider.characters.length,
        itemBuilder: (context, index) {
          final character = characterProvider.characters[index];
          return ListTile(
            leading: Image.network(character.image),
            title: Text(character.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(character: character),
                ),
              );
            },
          );
        },
      ),
    );
  }
}