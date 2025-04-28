part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSuccess({required this.books});
}

final class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errorMassage;

  const FeaturedBooksFailuer({required this.errorMassage});
}
