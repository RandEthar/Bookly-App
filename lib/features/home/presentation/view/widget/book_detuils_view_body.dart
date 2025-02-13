import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_detuils_section.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_detuils_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/similler_box_sections.dart';
import 'package:flutter/material.dart';

class BookDetuilsViewBody extends StatelessWidget {
  const BookDetuilsViewBody({super.key, required this.bookModel});
   final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             const   CustomBookDetuilsAppBar(),
               const  SizedBox(
                  height: 10,
                ),
                BookDetuilsSection(bookModel: bookModel,),
               const  Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
               const  SimillerBoxSections(),
               const  SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
