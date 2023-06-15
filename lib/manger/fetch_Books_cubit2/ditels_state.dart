part of 'ditels_cubit.dart';

@immutable
abstract class DitelsState {
  List<Object> get props => [];
}

class DitelsInitial extends DitelsState {}
class DetilsBooksStateInitial extends DitelsState {}

class DetilsBooksStateLoading extends DitelsState {}

class DetilsBooksStateError extends DitelsState {
  final String errorMsg;

  DetilsBooksStateError({required this.errorMsg});
}

class DetilsBooksStateSuccess extends DitelsState {
  final List<BookModels> books;

   DetilsBooksStateSuccess(this.books);
}
