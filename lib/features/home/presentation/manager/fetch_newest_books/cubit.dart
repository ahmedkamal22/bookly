import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksStates> {
  FetchNewestBooksCubit({required this.fetchNewestBooksUseCase})
      : super(FetchNewestBooksInitialState());

  static FetchNewestBooksCubit get(context) => BlocProvider.of(context);

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchNewestBooksLoadingState());
    } else {
      emit(FetchNewestBooksPaginationLoadingState());
    }
    var response = await fetchNewestBooksUseCase.call(pageNumber);
    response.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchNewestBooksFailureState(failure.message));
        } else {
          emit(FetchNewestBooksPaginationFailureState(failure.message));
        }
      },
      (books) => emit(FetchNewestBooksSuccessState(books)),
    );
  }
}
