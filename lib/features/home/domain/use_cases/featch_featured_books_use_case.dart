import 'package:bookly_app/core/errors/failuers.dart';
import 'package:bookly_app/core/use_cases/use_cases.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchFeaturedBooksUseCase implements UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FeatchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.featchFeaturedBooks();
  }
}
