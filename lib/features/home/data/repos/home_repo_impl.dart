import 'package:bookly_app/core/errors/failuers.dart';

import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';


class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failures, List<BookEntity>>> featchFeaturedBooks() async{
      try {
        List<BookEntity> books;
        books=homeLocalDataSource.featchFeaturedBooks();
        if(books.isNotEmpty){
          return right(books);
        }
   books= await   homeRemoteDataSource.featchFeaturedBooks();
  return right(books);
} on Exception catch (e) {
  //!
 return left(ServerFailures(e.toString()));
}
  }

  @override
  Future<Either<Failures, List<BookEntity>>> featchNewestBooks()async{
      try {
         List<BookEntity> books;
        books=homeLocalDataSource.featchNewestBooks();
        if(books.isNotEmpty){
          return right(books);
        }
   books= await   homeRemoteDataSource.featchNewestBooks();
  return right(books);
} on Exception catch (e) {
  //!
 return left(ServerFailures(e.toString()));
}
  }

  // @override
  // Future<Either<Failures, List<BookModel>>> fetchNewsetBooks() async {
  //   try {
  //     var data = await apiServises.get(
  //         endPoint:
  //             "volumes?q=subject:flutter&filtering=free-ebooxs&sort=newest");

  //     List<BookModel> books = [];
  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailures.fromDioError(e));
  //     }
  //     return left(ServerFailures(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
  //   try {
  //     var data = await apiServises.get(
  //         endPoint: "volumes?q=subject:flutter&filtering=free-ebooxs");

  //     List<BookModel> books = [];
  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailures.fromDioError(e));
  //     }
  //     return left(ServerFailures(e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
  //     {required String categories}) async {
  //   try {
  //     var data = await apiServises.get(
  //         endPoint:
  //             "volumes?q=subject:Programming&filtering=free-ebooxs&Sorting=relevance");

  //     List<BookModel> books = [];
  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailures.fromDioError(e));
  //     }
  //     return left(ServerFailures(e.toString()));
  //   }
  // }
}
