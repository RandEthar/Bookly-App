part of 'filter_book_cubit.dart';

sealed class FilterBookState extends Equatable {
  const FilterBookState();

  @override
  List<Object> get props => [];
}

final class FilterBookInitial extends FilterBookState {}

final class FilterBookSuccess extends FilterBookState {
  final List<BookModel> filterBooks;

  const FilterBookSuccess({required this.filterBooks});
}
