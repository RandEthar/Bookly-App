import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
   Future<Either<Failuers,List<BookModel>>>fetchNewsetBooks();
 Future<Either<Failuers,List<BookModel>>>fetchFeaturedBooks();


















}