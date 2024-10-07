import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class FetchFeaturedBooksStates {}

class FetchFeaturedBooksInitialState extends FetchFeaturedBooksStates {}

class FetchFeaturedBooksLoadingState extends FetchFeaturedBooksStates {}

class FetchFeaturedBooksSuccessState extends FetchFeaturedBooksStates {
  final List<BookEntity> books;

  FetchFeaturedBooksSuccessState(this.books);
}

class FetchFeaturedBooksFailureState extends FetchFeaturedBooksStates {
  final String msg;

  FetchFeaturedBooksFailureState(this.msg);
}

class FetchFeaturedBooksPaginationLoadingState
    extends FetchFeaturedBooksStates {}

class FetchFeaturedBooksPaginationFailureState
    extends FetchFeaturedBooksStates {
  final String msg;

  FetchFeaturedBooksPaginationFailureState(this.msg);
}
