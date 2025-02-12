import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class SimillerBoxListView extends StatelessWidget {
  const SimillerBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .16,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: CustomListViewItem(imageUrl: 'http://books.google.com/books/content?id=6BaJDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',),
              );
            }),
      ),
    );
  }
}
