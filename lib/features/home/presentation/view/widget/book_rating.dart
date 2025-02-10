

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment=MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(
    
    BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
     const Icon(Iconsax.star1,color: Color(0xffFFDD4F),size: 14,),
     const  SizedBox(width: 6.3,),
      const Text("4.8",style: Styles.textStyle16,),
      const SizedBox(width:5 ,),
      Text("(2390)",style: Styles.textStyle14.copyWith(
       color: Colors.white.withOpacity(0.5)
      ),),






    ],);
  }
}


