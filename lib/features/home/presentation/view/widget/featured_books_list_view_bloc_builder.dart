


import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view/widget/featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksLstViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksLstViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
  return FeaturedBooksListView(books:state.books,);
}else if(state is FeaturedBooksFailuer){
  

return Text(state.errorMassage);

}else{
return const CircularProgressIndicator();
}
      },
    );
  }
}