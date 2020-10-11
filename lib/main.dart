import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './data/state/rating_store.dart';
import './data/rating_repositiory.dart';
import './pages/anime_search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider(
        create: (ctxt) => RatingStore(FakeRatingRepository()),
        child: AnimeSearchPage(),
      ),
    );
  }
}