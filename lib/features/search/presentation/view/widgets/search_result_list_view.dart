


import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return     ListView.builder(
     
      itemBuilder: (context,index){
      return  const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 6),
        child:Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: BestSellerListViewItem(),
        ),
      );
    });
  }
}