import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String categories});
}
