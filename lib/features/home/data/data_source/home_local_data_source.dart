import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks();
  List<BookEntity> featchNewestBooks();
}
class HomeLocalDataSourceImple extends  HomeLocalDataSource{
  @override
  List<BookEntity> featchFeaturedBooks() {
    // TODO: implement featchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> featchNewestBooks() {
    // TODO: implement featchNewestBooks
    throw UnimplementedError();
  }

}
