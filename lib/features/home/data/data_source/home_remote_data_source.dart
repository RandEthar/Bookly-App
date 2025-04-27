import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_servises.dart';
import 'package:bookly_app/core/utils/functions/save_data.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';


abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturedBooks();
  Future<List<BookEntity>> featchNewestBooks();
}

class HomeRemoteDataSourceImple extends HomeRemoteDataSource {
  final ApiServises apiServises;
  HomeRemoteDataSourceImple({required this.apiServises});
  @override
  Future<List<BookEntity>> featchFeaturedBooks() async {
    var data = await apiServises.get(
        endPoint: "volumes?Filtering=free-ebooxs&q=Programming");
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books, kFeaturedBook);
    return books;
  }
  @override
  Future<List<BookEntity>> featchNewestBooks() async {
    var data = await apiServises.get(
        endPoint: "volumes?Filtering=free-ebooxs&q=Programming&Sorting=newest");
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books, kNewestBook);
    return getBooksList(data);
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
