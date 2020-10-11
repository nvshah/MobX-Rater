import 'package:mobx/mobx.dart';

import '../rating_repositiory.dart';
import '../models/rating.dart';

part 'rating_store.g.dart';

//* This is equivalent to extend class with empty body
//class RatingStore = _RatingStore with _$RatingStore;
class RatingStore extends _RatingStore with _$RatingStore {
  RatingStore(RatingRepository ratingRepository) : super(ratingRepository);
}

//To make UI- loading Simpler in understanding & readable
enum StoreState { initial, loading, loaded }

abstract class _RatingStore with Store {
  final RatingRepository _ratingRepository;

  _RatingStore(this._ratingRepository);

  @observable
  Rating rating;

  @observable
  String errorMessage;

  //Complementary field - If this will change then state property will also get changed
  @observable
  ObservableFuture<Rating> _ratingFuture;

  //* we will update the UI by observing the StoreState instance instead.
  //Just to make ObservableFuture intricacies simpler we are mapping ObservableFuture <-> StoreState
  @computed
  StoreState get state {
    //If user has not yet search for a anime ratings or there has been error
    if (_ratingFuture == null ||
        _ratingFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    //Pending Future means "loading"
    //Fulfilled Future means "loaded"
    return _ratingFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  //this can notify about state change to listeners
  @action
  Future getRating(String animeName) async {
    try {
      //Reset the possible previous message
      errorMessage = null;
      //Fetch rating from the repo & wrap the regular future into Observable
      //This _ratingFuture triggers updates to the computed state property
      _ratingFuture = ObservableFuture(_ratingRepository.getRating(animeName));
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.
      rating = await _ratingFuture;
    } on NetworkError {
      errorMessage = "Couldn't get the ratings. Is the device online ?";
    }
  }
}
