import 'package:bookly_app/constants.dart';

import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cudit/newest_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setupServiceLocator();
  runApp(const BooklyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBook);
  await Hive.openBox<BookEntity>(kNewestBook);
  Bloc.observer=SimpleBlocObserver();
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          FeaturedBooksCubit(FeatchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()))..featchFeaturedBooks(),
        ), BlocProvider(
          create: (context) =>
          NewestBooksCubit( FeatchNewestBooksUseCase(getIt.get<HomeRepoImpl>())),
        )
      ],
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            ),
          )),
    );
  }
}
