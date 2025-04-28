import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        // if (state is FeaturedBooksSuccess) {
        //   return BookListView(isLoading: false, books: state.books);
        // } else 
        if (state is FeaturedBooksFailuer) {
          return CustomErrorWidget(text: state.errorMassage);
        } else {
          return BookListView(isLoading: true, books: []);
        }
      },
    );
  }
}

class BookListView extends StatelessWidget {
  const BookListView({
    super.key,
    required this.books,
    required this.isLoading,
  });

  final List<BookModel> books;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 4),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .26,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: isLoading ? 5 : books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: isLoading
                  ? Container(
                      width: 120,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                    ).redacted(
                      context: context,
                      redact: true,
                      configuration: RedactedConfiguration(
                        animationDuration: Duration(milliseconds: 800),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        GoRouter.of(context).push(
                            extra: books[index], AppRouter.kBookDetuilsView);
                      },
                      child: CustomBookImage(
                        imageUrl: books[index].volumeInfo.imageLinks.thumbnail,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
