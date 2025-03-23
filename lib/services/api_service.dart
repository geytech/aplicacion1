import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Character> characters = [];
      for (var item in data['results']) {
        characters.add(Character.fromJson(item));
      }
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}