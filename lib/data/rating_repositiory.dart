import 'dart:math';

import 'models/rating.dart';

abstract class RatingRepository {
  Future<Rating> getRating(String animeName);
}

//Simulates fetching the ratings over a newtirk by simply generating random rating
class FakeRatingRepository implements RatingRepository {
  @override
  Future<Rating> getRating(String animeName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network error
        if (random.nextBool()) {
          throw NetworkError();
        }

        double randomRating = 1 + random.nextInt(9) + random.nextDouble();

        // Return "fetched" anime-rating
        return Rating(
          animeName: animeName,
          // Random Rating between 1 & 10
          ratingScore: randomRating,
        );
      },
    );
  }
}

class NetworkError extends Error {}
