import '../../../../core/failure.dart';
import '../../../../core/usecase.dart';
import '../entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

import '../respositories/number_trivia_repository.dart';

class GetConcreteRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;
  GetConcreteRandomNumberTrivia(this.repository);
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
