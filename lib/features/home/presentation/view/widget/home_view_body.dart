import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view/widget/best_seller_list_view.dart';

import 'package:bookly_app/features/home/presentation/view/widget/custom_app_bar.dart';

import 'package:bookly_app/features/home/presentation/view/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(),
                FeaturedBooksListView(),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Best Seller',
                      style: Styles.textStyle18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
       
                BestSellerListView(),
         
        ],
      ),
    );
  }
}


    
    
    
    
    
    
    
    
    /*const SafeArea(
      child: Column(children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Best Seller',
                style: Styles.textStyle18,
               
              )),
        ),  SizedBox(
          height: 20,
        ),
        
        BestSellerListView()
      ]),
    );*/

