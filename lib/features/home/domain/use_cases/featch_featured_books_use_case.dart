
import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchFeaturedBooksUseCase {
  final HomeRepos homeRepo;

  FeatchFeaturedBooksUseCase({required this.homeRepo});

    Future<Either<Failures,List<BookEntity>>> featchFeaturedBooks(){
      //!check premssion الصلاحيات
      return homeRepo.featchFeaturedBooks();
    }
}
