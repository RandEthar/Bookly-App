import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks();
  List<BookEntity> featchNewestBooks();
}
class HomeLocalDataSourceImple extends  HomeLocalDataSource{
  @override
  List<BookEntity> featchFeaturedBooks() {
  var box =Hive.box<BookEntity>(kFeaturedBook);
  return box.values.toList();
  }

  @override
  List<BookEntity> featchNewestBooks() {
   var box =Hive.box<BookEntity>(kNewestBook);
  return box.values.toList();
  }

}
