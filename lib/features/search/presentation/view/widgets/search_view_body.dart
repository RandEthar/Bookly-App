import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/search/presentation/manger/filter_book_cubit/filter_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/custom_search_text_feild.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.listBook});
  final List<BookModel> listBook;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomSearchTextFeild(
              onChanged: (value) {
                context.read<FilterBookCubit>().filterBook(listBook, value);
              },
            )),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 20),
          child: Text(
            'Search Result',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        Expanded(child: BlocBuilder<FilterBookCubit, FilterBookState>(
          builder: (context, state) {
            if (state is FilterBookSuccess) {
              return SearchResultListView(
                listBook: state.filterBooks,
              );
            } else if (state is FilterBookInitial) {
              return SearchResultListView(
                listBook: listBook,
              );
            } else {
              return const CustomLoadingIndecator();
            }
          },
        ))
      ],
    );
  }
}
