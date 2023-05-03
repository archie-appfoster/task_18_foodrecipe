import 'package:flutter/material.dart';
import 'package:task_18_foodrecipe/Recipecard.dart';
import 'package:task_18_foodrecipe/recipe.dart';

class Homepage extends StatefulWidget {



  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Recipe>_recipe;
  bool _isloading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose recipe as per your mood"),
        centerTitle: true,
        actions: [
          Icon(Icons.local_dining)
        ],
      ),
      body: _isloading
        ?Center(child: CircularProgressIndicator(),)
          : ListView.builder(
        itemCount: _recipe.length,
          itemBuilder: (context,index){
    return Recipedata(
    title: _recipe[index].name,
    cookTime: _recipe[index].totalTime,
    rating: _recipe[index].rating.toString(),
    thumbnailUrl: _recipe[index].images);
    }


      )
    );
  }
}
