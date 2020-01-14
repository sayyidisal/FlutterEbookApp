import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/podo/category.dart';
import 'package:flutter_ebook_app/providers/favorites_provider.dart';
import 'package:flutter_ebook_app/widgets/book.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FavoritesProvider favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favorites",
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        shrinkWrap: true,
        itemCount: favoritesProvider.posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 200/340,
        ),
        itemBuilder: (BuildContext context, int index) {
          Entry entry = Entry.fromJson(favoritesProvider.posts[index]["item"]);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: BookItem(
              img: entry.link[1].href,
              title: entry.title.t,
              entry: entry,
            ),
          );
        },
      ),
    );
  }
}