import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, this.bookModel});
  final BookModel? bookModel;

  @override
  Widget build(BuildContext context) {
    if (bookModel == null ||
        bookModel!.volumeInfo.imageLinks?.thumbnail == null) {
      return const Center(child: Text("بيانات الكتاب غير متوفرة"));
    }

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetuilsView, extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 80,
              child: CustomBookImage(
                imageUrl: bookModel!.volumeInfo.imageLinks?.thumbnail ?? "",
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      bookModel!.volumeInfo.title ?? "عنوان غير متوفر",
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFine),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel!.volumeInfo.authors != null &&
                            bookModel!.volumeInfo.authors!.isNotEmpty
                        ? bookModel!.volumeInfo.authors![0]
                        : "مؤلف غير معروف",
                    style: Styles.textStyle14
                        .copyWith(color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel!.volumeInfo.maturityRating ?? "0",
                        count: bookModel!.volumeInfo.pageCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
