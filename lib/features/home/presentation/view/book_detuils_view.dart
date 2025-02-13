import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';

import 'package:bookly_app/features/home/presentation/view/widget/book_detuils_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookDetuilsView extends StatefulWidget {
  const BookDetuilsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetuilsView> createState() => _BookDetuilsViewState();
}

class _BookDetuilsViewState extends State<BookDetuilsView> {
@override

void initState() {
  super.initState();
  
  final category = widget.bookModel.volumeInfo.categories?.isNotEmpty == true 
      ? widget.bookModel.volumeInfo.categories![0] 
      : "Unknown"; // قيمة افتراضية

  context.read<SimilarBooksCubit>().featchSimilarBooks(categories: category);
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetuilsViewBody(bookModel: widget.bookModel,),
    );
  }
}
