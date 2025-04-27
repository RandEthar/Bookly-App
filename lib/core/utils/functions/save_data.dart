
  import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';
//! جبت البوكس يلي فتحته بالمين وخنت فيه كل البيانات
void saveBoxData(List<BookEntity> books,String boxName) {
    var box=Hive.box(boxName);
    box.addAll(books);
  }