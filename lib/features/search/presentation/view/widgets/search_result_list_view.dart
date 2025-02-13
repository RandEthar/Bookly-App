import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view_item.dart';

import 'package:flutter/material.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.listBook});
  final List<BookModel> listBook;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listBook.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BestSellerListViewItem(
                bookModel: listBook[index],
              ),
            ),
          );
        });
  }
}
