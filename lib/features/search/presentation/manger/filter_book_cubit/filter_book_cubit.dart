import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'filter_book_state.dart';

class FilterBookCubit extends Cubit<FilterBookState> {
  FilterBookCubit() : super(FilterBookInitial());

  void filterBook(List<BookModel> allBook, String nameBook) {
    if (nameBook.isEmpty) {
      emit(FilterBookInitial());
    } else {
      List<BookModel> filterlist = allBook
          .where((book) => book.volumeInfo.title!
              .toLowerCase()
              .contains(nameBook.toLowerCase()))
          .toList();
            log(nameBook);
          
      emit(FilterBookSuccess(filterBooks: filterlist));
    }
  }
}
