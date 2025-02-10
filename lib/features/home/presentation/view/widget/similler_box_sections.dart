import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view/widget/similler_box_list_view.dart';
import 'package:flutter/material.dart';

class SimillerBoxSections extends StatelessWidget {
  const SimillerBoxSections ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 

       Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text('You can also like',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600
                ),),
              ),
                 const SizedBox(
                height: 16,
              ),
          const Padding(
             padding:  EdgeInsets.only(left: 14),
             child:   SimillerBoxListView(),
           )
               ,  ],);
  }
}