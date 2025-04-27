import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> featchFeaturedBooks();
  Future<Either<Failures, List<BookEntity>>> featchNewestBooks();
}
