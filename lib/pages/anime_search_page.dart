import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../components/anime_input_field.dart';
import '../data/models/rating.dart';
import '../data/state/rating_store.dart';

class AnimeSearchPage extends StatefulWidget {
  @override
  _AnimeSearchPageState createState() => _AnimeSearchPageState();
}

class _AnimeSearchPageState extends State<AnimeSearchPage> {
  RatingStore _ratingStore;
  List<ReactionDisposer> _disposers;
  // For showing a SnackBar
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ratingStore ??= Provider.of<RatingStore>(context);
    _disposers ??= [
      reaction(
        //Tell the reaction which observable to observe
        (_) => _ratingStore.errorMessage,
        //Run some logic with the content of the observed field
        (String message){
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text(message),)
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    //dispose each reaction
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Anime Rater'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        //TODO: implement with MobX
        //We will observe computed property i.e state & based on it's value updates our UI wil update 
        child: Observer(
          builder: (_){
            switch(_ratingStore.state){
              case StoreState.initial:
                return _buildInitialInput();
              case StoreState.loading:
                return _buildLoading();
              case StoreState.loaded:
                return _buildColumnWithData(_ratingStore.rating);
            }
          }
        ),
        //child: _buildInitialInput(),
      ),
    );
  }

  //Intput field - initial phase
  Widget _buildInitialInput() {
    return Center(
      child: AnimeInputField(),
    );
  }
  
  //Loading Indicator
  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  //build data
  Widget _buildColumnWithData(Rating rating) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //Anime
        Text(
          rating.animeName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        //Rating
        Text(
          '${rating.ratingScore.toStringAsFixed(1)} <--',
          style: TextStyle(
            fontSize: 80,
          ),
        ),
        //Input
        AnimeInputField(),
      ],
    );
  }
}
