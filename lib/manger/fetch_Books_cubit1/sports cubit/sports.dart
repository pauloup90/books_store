import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/data/models.dart';
import '../../../core/errors/failure.dart';
import '../../fetch_Books_cubit2/programing_books_state.dart';

class SportsBooksCubit extends Cubit<ProgramingBooksState> {
  SportsBooksCubit() : super(ProgramingBooksInitial());

  static SportsBooksCubit get(context) => BlocProvider.of(context);
  BookModels? bookModels;

  Future<void> fetchFutureBooks2() async {
    emit(ProgramingBooksLoading());
    try {
      final response = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q= ceramics");
      if (response.statusCode == 200) {
        bookModels = BookModels.fromJson(response.data);
        emit(ProgramingBookSuccess());
        print(response.data);
        print("*" * 100);
      } else {
        emit(ProgramingBooksError(errorMsg: "erooooor"));
      }
    } on DioError catch (e) {
      ServerFailure;
      } catch (e) {
      emit(ProgramingBooksError(errorMsg: 'An unknown error: $e'));
    }
  }


}
