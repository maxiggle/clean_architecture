import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure.dart';
import '../entities/number_trivia.dart';
import '../respositories/number_trivia_repository.dart';

///
class GetConcreteNumberTrivia {
  final NumberTriviaRepository numberTriviaRepository;
  const GetConcreteNumberTrivia(this.numberTriviaRepository);
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    final result =
        await numberTriviaRepository.getConcreteNumberTrivia(params.number);
    return result;
  }
}

class Params extends Equatable {
  final int number;
  const Params(this.number);
  @override
  List<Object> get props => [number];
}
