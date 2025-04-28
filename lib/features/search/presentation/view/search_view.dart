import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cudit/newest_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();

    // context.read<NewestBooksCubit>().featchNewestedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          if (state is NewestBooksSuccess) {
            return SearchViewBody(
              listBook: state.books,
            );
          } else if (state is NewestBooksFailuer) {
            return CustomErrorWidget(
              text: state.errorMassage,
            );
          } else {
            return const CustomLoadingIndecator();
          }
        },
      )),
    );
  }
}
