import 'package:bookly_app/core/utils/styles.dart';

import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widget/books_action.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_detuils_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetuilsViewBody extends StatelessWidget {
  const BookDetuilsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBookDetuilsAppBar(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .27),
            child: const CustomListViewItem(),
          ),
          const SizedBox(
            height: 43,
          ),
          const Text('The Jungle Book',style: Styles.textStyle30,),
          const SizedBox(
            height: 6,
          ),
          Text('Rudyard Kipling',style: Styles.textStyle18.copyWith(
         fontStyle: FontStyle.italic,
         fontWeight: FontWeight.w500,
         color: Colors.white.withOpacity(0.7)
          ),), const SizedBox(
            height: 18,
          ),
        const   BookRating(mainAxisAlignment:MainAxisAlignment.center ,)
       , const SizedBox(
            height: 37,
          ), 
      const  Padding(
         padding: EdgeInsets.symmetric(horizontal: 38),
         child: BooksAction(),
       )
        ],
      ),
    );
  }
}


