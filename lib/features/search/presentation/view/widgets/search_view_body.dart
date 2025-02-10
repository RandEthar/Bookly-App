
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/custom_search_text_feild.dart';
import 'package:bookly_app/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:EdgeInsets.symmetric(horizontal: 20),
          child:CustomSearchTextFeild()
          ),SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 24,bottom: 20),
            child: Text('Search Result',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w900
                  ),),
          ),
     Expanded(child: SearchResultListView())
      ],
    );
  }

    

}
