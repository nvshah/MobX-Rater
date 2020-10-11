import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/state/rating_store.dart';

class AnimeInputField extends StatelessWidget {
  final textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: textController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter Anime",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: GestureDetector(child: Icon(Icons.search), onTap: () => submitAnimeName(context, textController.text ?? "",),)
        ),
        onSubmitted: (value) => submitAnimeName(context, value),
      ),
    );
  }
  
  //Submit anime name & get corresponding Rating
  void submitAnimeName(BuildContext context, String animeName){
    //TODO : Get ratings for the anime
    final ratingStore = Provider.of<RatingStore>(context);
    //get ratings
    ratingStore.getRating(animeName);
  }
}