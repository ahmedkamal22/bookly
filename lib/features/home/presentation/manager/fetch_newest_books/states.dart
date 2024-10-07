import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class FetchNewestBooksStates {}

class FetchNewestBooksInitialState extends FetchNewestBooksStates {}

class FetchNewestBooksLoadingState extends FetchNewestBooksStates {}

class FetchNewestBooksSuccessState extends FetchNewestBooksStates {
  final List<BookEntity> books;

  FetchNewestBooksSuccessState(this.books);
}

class FetchNewestBooksFailureState extends FetchNewestBooksStates {
  final String msg;

  FetchNewestBooksFailureState(this.msg);
}

class FetchNewestBooksPaginationLoadingState extends FetchNewestBooksStates {}

class FetchNewestBooksPaginationFailureState extends FetchNewestBooksStates {
  final String msg;

  FetchNewestBooksPaginationFailureState(this.msg);
}
