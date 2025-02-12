import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, top: 4),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .26,
              child: ListView.builder(
                physics:const BouncingScrollPhysics(),
                itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding:const  EdgeInsets.symmetric(horizontal: 6),
                      child: CustomListViewItem(imageUrl:state.books[index].volumeInfo.imageLinks.thumbnail,),
                    );
                  }),
            ),
          );
        } else if (state is FeaturedBooksFailuer) {
          return CustomErrorWidget(
            text: state.errorMassage,
          );
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
