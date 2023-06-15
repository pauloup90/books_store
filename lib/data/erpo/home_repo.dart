import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../models.dart';


abstract class HomeRepo {
  Future<Either<Failure, List<BookModels>>> fetchProgramingBooks();

  Future<Either<Failure, List<BookModels>>> fetchFutureBooks();
}
