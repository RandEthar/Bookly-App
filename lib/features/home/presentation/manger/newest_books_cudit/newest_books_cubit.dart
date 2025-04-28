import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/domain/use_cases/featch_newest_books_use_case.dart';

import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.featchNewestBooksUseCase) : super(NewestBooksInitial());

  final FeatchNewestBooksUseCase featchNewestBooksUseCase;

  Future<void> featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await featchNewestBooksUseCase.call();
    result.fold((l) {
      emit(NewestBooksFailuer(errorMassage: l.toString()));
    }, (r) {
      emit( NewestBooksSuccess(books: r));
    });
  }
}
