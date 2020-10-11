import 'package:meta/meta.dart';

class Rating{
  final String animeName;
  final double ratingScore;

  Rating({
    @required this.animeName,
    @required this.ratingScore,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Rating &&
        o.animeName == animeName &&
        o.ratingScore == ratingScore;
  }

  @override
  int get hashCode => animeName.hashCode ^ ratingScore.hashCode;
}