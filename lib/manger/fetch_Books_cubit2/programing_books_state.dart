abstract class ProgramingBooksState {}

class ProgramingBooksInitial extends ProgramingBooksState {}

class ProgramingBooksLoading extends ProgramingBooksState {}

class ProgramingBooksError extends ProgramingBooksState {
  final String errorMsg;

  ProgramingBooksError({required this.errorMsg});
}

class ProgramingBookSuccess extends ProgramingBooksState {}
