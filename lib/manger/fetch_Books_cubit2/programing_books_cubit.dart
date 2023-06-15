import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models.dart';
import 'programing_books_state.dart';


class ProgramingBooksCubit extends Cubit<ProgramingBooksState> {
  ProgramingBooksCubit() : super(ProgramingBooksInitial());

  static ProgramingBooksCubit get(context) => BlocProvider.of(context);
  BookModels? bookModels;

  Future<void> fetchFutureBooks() async {
    emit(ProgramingBooksLoading());
    try {
      final response = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q= Metaphysics  ");
      if (response.statusCode == 200) {
        bookModels = BookModels.fromJson(response.data);
        emit(ProgramingBookSuccess(

        ));
        print(response.data);
        print("* " * 100);
      } else {
        emit(ProgramingBooksError(errorMsg: "erooooor"));
      }
    } on DioError catch (e) {
      String errorMsg;
      if (e.type == DioErrorType.cancel) {
        errorMsg = 'Request was cancelled';
        emit(ProgramingBooksError(errorMsg: errorMsg));
      } else if (e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        errorMsg = 'Connection timed out';
        emit(ProgramingBooksError(errorMsg: errorMsg));
      } else if (e.type == DioErrorType.badResponse) {
        errorMsg = 'Invalid status code: ${e.error}';
        emit(ProgramingBooksError(errorMsg: errorMsg));
      } else {
        errorMsg = 'An unexpected error : ${e.error}';
        emit(ProgramingBooksError(errorMsg: errorMsg));
      }
    } catch (e) {
      emit(ProgramingBooksError(errorMsg: 'An unknown error: $e'));
    }
  }


}
