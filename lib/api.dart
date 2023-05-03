import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_18_foodrecipe/recipe.dart';
import 'package:http/http.dart'as http;

class apiRecipe{
  Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "2c452c3308msh3f38a5ab2c6da49p1790d1jsn435a7a644890",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['feed']) {
  _temp.add(i['content']['details']);
  }

  return Recipe.recipesFromSnapshot(_temp);
}
}