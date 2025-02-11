import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetuilsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AssetsData.TestImage,
                  height: 120,
                  width: 80,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "Harry Potter land the Goblet of Fire ",
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGTSectraFine),
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'J.K. Rowling',
                    style: Styles.textStyle14
                        .copyWith(color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text('19.99 €',
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold)),
                        Spacer(),
                        const BookRating()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
