part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();
  
  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}
