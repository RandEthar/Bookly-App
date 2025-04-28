import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount:7,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  // child: BestSellerListViewItem(
                  //   bookModel: state.books[index],
                  // ),
                );
              },
            ),
          );
    
    
    
    
  
    
    // BlocBuilder<NewestBooksCubit, NewestBooksState>(
    //   builder: (context, state) {
    //     if (state is NewestBooksSuccess) {
    //       return SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           childCount: state.books.length,
    //           (context, index) {
    //             return Padding(
    //               padding: const EdgeInsets.only(bottom: 20),
    //               child: BestSellerListViewItem(
    //                 bookModel: state.books[index],
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     } else if (state is NewestBooksFailuer) {
    //       return SliverToBoxAdapter(
    //           child: CustomErrorWidget(
    //         text: state.errorMassage,
    //       ));
    //     } else {
    //       return const SliverToBoxAdapter(child: CustomLoadingIndecator());
    //     }
    //   },
    // );
  }
}
