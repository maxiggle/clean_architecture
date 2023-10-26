import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/number_trivia.dart';
import '../respositories/number_trivia_repository.dart';

///
class GetConcreteNumberTrivia {
  final NumberTriviaRepository numberTriviaRepository;
  const GetConcreteNumberTrivia(this.numberTriviaRepository);
  Future<Either<Failure, NumberTrivia>> call({required int number}) async {
    final result = await numberTriviaRepository.getConcreteNumberTrivia(number);
    return result;
  }
}
