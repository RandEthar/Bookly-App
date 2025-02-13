import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';

import 'package:bookly_app/features/home/presentation/view/widget/books_action.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetuilsSection extends StatelessWidget {
  const BookDetuilsSection({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
   
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .29),
          child: CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??" ",),
        ),
        const SizedBox(
          height: 43,
        ),
         Text(
        textAlign:TextAlign.center,
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.7)),
        ),
        const SizedBox(
          height: 18,
        ),
      const   BookRating(
              count: 3950 ,
          rating:"4.8" ,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 38),
          child: BooksAction(bookModel: bookModel,),
        ),
      ],
    );
  }
}
