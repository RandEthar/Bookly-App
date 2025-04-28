import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> featchFeaturedBooks({int pageNumber=0});
  Future<Either<Failures, List<BookEntity>>> featchNewestBooks();
}
