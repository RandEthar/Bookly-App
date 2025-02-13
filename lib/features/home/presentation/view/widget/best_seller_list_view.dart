import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cudit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                    childCount: state.books.length,
              (context, index) {
                return  Padding(
                  padding:const  EdgeInsets.only(bottom: 20),
                  child: BestSellerListViewItem(bookModel: state.books[index] ,),
                );
              },
           
            ),
          );
        }else if(state is NewestBooksFailuer){

          return SliverToBoxAdapter(child: CustomErrorWidget(text: state.errorMassage,));
        }else{
         return const SliverToBoxAdapter(child:CustomLoadingIndecator());

        }
      },
    );
  }
}
