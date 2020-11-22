import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/services/apihelper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textController = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<ApiHelper>(context);
    return Consumer<ApiHelper>(
      builder: (context, data, child) => Scaffold(
          appBar: AppBar(
            title: Text("Search for recipes"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.ac_unit),
            onPressed: () {
              data.fetchRecipes();
            },
          ),
          body: GridView.builder(
            itemCount: data.recipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new GridTile(
                  footer: Text(data.recipes[index].title),
                  child: Text("Null"),
                ),
              );
            },
          )),
    );
  }
}
