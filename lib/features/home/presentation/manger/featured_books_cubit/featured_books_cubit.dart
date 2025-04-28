import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FeatchFeaturedBooksUseCase featchFeaturedBooksUseCase;

  Future<void> featchFeaturedBooks({int pageNumber=0}) async {
    emit(FeaturedBooksLoading());
    var result = await featchFeaturedBooksUseCase.call(pageNumber);
    result.fold((l) {
    emit(FeaturedBooksFailuer(errorMassage: l.errorMessage)); 
    }, (r) {
      emit(FeaturedBooksSuccess(books: r));
    });
  }
}
