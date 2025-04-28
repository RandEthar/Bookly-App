import 'dart:async';
import 'dart:developer';

import 'package:bookly_app/core/errors/failuers.dart';

import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';

import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failures, List<BookEntity>>> featchFeaturedBooks({int pageNumber=0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.featchFeaturedBooks();
      if (books.isNotEmpty) {
        print(books.toString());
        return right(books);
      }
      books = await homeRemoteDataSource.featchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> featchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.featchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.featchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }
}
