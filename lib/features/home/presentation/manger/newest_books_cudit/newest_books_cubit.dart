import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());


   final HomeRepo homeRepo;
  Future<void> featchNewestedBooks() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
        (failuer) =>
            emit(NewestBooksFailuer(errorMassage: failuer.errorMessage)),
        (books) => emit(NewestBooksSuccess(books: books)));
  }
}
