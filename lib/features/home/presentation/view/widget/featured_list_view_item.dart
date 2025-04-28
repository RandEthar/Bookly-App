
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';

import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
late  final ScrollController scrollController;
  @override
  void initState() {
  
    super.initState();
    scrollController=ScrollController();
    scrollController.addListener(_scrollListener);
  
  }
    void _scrollListener() {
      //المكان يلي انا واقفه فيه
      var currentPosition=scrollController.position.pixels;
      var maxScrollLength=scrollController.position.maxScrollExtent;
      if(currentPosition>=maxScrollLength*0.7){

         context.read<FeaturedBooksCubit>().featchFeaturedBooks();

      }
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();


  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .26,
        child: ListView.builder(
         controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount:widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                // onTap: () {
                //   GoRouter.of(context).push(
                //       extra: books[index], AppRouter.kBookDetuilsView);
                // },
                child: CustomBookImage(
                  imageUrl: widget.books[index].image ?? "",
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  
}


