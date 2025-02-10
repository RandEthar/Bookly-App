import 'package:bookly_app/features/home/presentation/view/widget/book_detuils_section.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_book_detuils_app_bar.dart';
import 'package:bookly_app/features/home/presentation/view/widget/similler_box_sections.dart';
import 'package:flutter/material.dart';

class BookDetuilsViewBody extends StatelessWidget {
  const BookDetuilsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBookDetuilsAppBar(),
                SizedBox(
                  height: 10,
                ),
                BookDetuilsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimillerBoxSections(),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
