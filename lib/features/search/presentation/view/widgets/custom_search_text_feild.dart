


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.search_normal_1),
                ),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder()),
          );
  }


  
  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.white));
  }
}