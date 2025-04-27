import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  Future<void> featchSimilarBooks({required String categories}) async {
    emit(SimilarBooksLoading());

    var result = await homeRepo.fetchSimilarBooks(categories: categories);
    result.fold(
        (failuer) =>
            emit(SimilarBooksFailuer(errorMassage: failuer.errorMessage)),
        (books) => emit(SimilarBooksSuccess(books: books)));
  }
}
