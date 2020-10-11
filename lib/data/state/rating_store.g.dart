// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RatingStore on _RatingStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$ratingAtom = Atom(name: '_RatingStore.rating');

  @override
  Rating get rating {
    _$ratingAtom.context.enforceReadPolicy(_$ratingAtom);
    _$ratingAtom.reportObserved();
    return super.rating;
  }

  @override
  set rating(Rating value) {
    _$ratingAtom.context.conditionallyRunInAction(() {
      super.rating = value;
      _$ratingAtom.reportChanged();
    }, _$ratingAtom, name: '${_$ratingAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_RatingStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_ratingFutureAtom = Atom(name: '_RatingStore._ratingFuture');

  @override
  ObservableFuture<Rating> get _ratingFuture {
    _$_ratingFutureAtom.context.enforceReadPolicy(_$_ratingFutureAtom);
    _$_ratingFutureAtom.reportObserved();
    return super._ratingFuture;
  }

  @override
  set _ratingFuture(ObservableFuture<Rating> value) {
    _$_ratingFutureAtom.context.conditionallyRunInAction(() {
      super._ratingFuture = value;
      _$_ratingFutureAtom.reportChanged();
    }, _$_ratingFutureAtom, name: '${_$_ratingFutureAtom.name}_set');
  }

  final _$getRatingAsyncAction = AsyncAction('getRating');

  @override
  Future getRating(String animeName) {
    return _$getRatingAsyncAction.run(() => super.getRating(animeName));
  }
}
