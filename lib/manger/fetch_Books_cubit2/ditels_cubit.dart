import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/data/models.dart';
import '../../../core/errors/failure.dart';
part 'ditels_state.dart';


class DitelsCubit extends Cubit<DitelsState> {
  DitelsCubit() : super(DitelsInitial());

  static DitelsCubit get(context) => BlocProvider.of(context);
  BookModels? bookModels;

  Future<void> bookDetailsCubit(  ) async {
    emit(DetilsBooksStateLoading());
    try {
      final response = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:History of Africa ");
      if (response.statusCode == 200) {
        bookModels = BookModels.fromJson(response.data);
            (books) {
          emit(DetilsBooksStateSuccess( books));
        };

        print(response.data);
        print("* " * 100);
      } else {
        emit(DetilsBooksStateError(errorMsg: "erooooor"));
      }
    } on DioError catch (e) {
      ServerFailure;
    } catch (e) {
      emit(DetilsBooksStateError(errorMsg: 'An unknown error: $e'));
    }
  }
}
