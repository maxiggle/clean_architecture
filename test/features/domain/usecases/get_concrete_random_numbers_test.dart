import 'package:clean_architecture_tutorial/core/usecase.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/respositories/number_trivia_repository.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/usescases/get_concrete_random_numbers.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_concrete_random_numbers_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  // ignore: unused_local_variable
  late GetConcreteRandomNumberTrivia useCase;
  late NumberTriviaRepository mockNumberTriviaRepository;
  late NumberTrivia testNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetConcreteRandomNumberTrivia(mockNumberTriviaRepository);
    testNumberTrivia = const NumberTrivia(text: 'test', number: 1);
  });

  test('Should get trivia from repository', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(testNumberTrivia));

    final result = await useCase(NoParams());

    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
