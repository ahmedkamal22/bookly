import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksStates> {
  FetchFeaturedBooksCubit({required this.fetchFeaturedBooksUseCase})
      : super(FetchFeaturedBooksInitialState());

  static FetchFeaturedBooksCubit get(context) => BlocProvider.of(context);
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeaturedBooksLoadingState());
    } else {
      emit(FetchFeaturedBooksPaginationLoadingState());
    }
    var response = await fetchFeaturedBooksUseCase.call(pageNumber);
    response.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchFeaturedBooksFailureState(failure.message));
        } else {
          emit(FetchFeaturedBooksPaginationFailureState(failure.message));
        }
      },
      (books) => emit(FetchFeaturedBooksSuccessState(books)),
    );
  }
}
