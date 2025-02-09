import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      
      aspectRatio: 2.7/ 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
            color: Colors.amber,
            image:const DecorationImage(
                image: AssetImage(AssetsData.TestImage), fit: BoxFit.fill)),
      ),
    );
  }
}
