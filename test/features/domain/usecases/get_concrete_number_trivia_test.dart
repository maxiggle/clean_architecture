import 'package:clean_architecture_tutorial/core/usecase.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/respositories/number_trivia_repository.dart';
import 'package:clean_architecture_tutorial/features/number_trivia/domain/usescases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  // ignore: unused_local_variable
  late GetConcreteNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late NumberTrivia testNumberTrivia;
  late int testNumber = 1;

  setUp(() => {
        mockNumberTriviaRepository = MockNumberTriviaRepository(),
        useCase = GetConcreteNumberTrivia(mockNumberTriviaRepository),
        testNumberTrivia = NumberTrivia(text: 'test', number: testNumber),
        testNumber = 1,
      });

  test('should get trivia for the number, from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber))
        .thenAnswer((_) async => Right(testNumberTrivia));
    // act
    final result = await useCase(Params(testNumber));

    // assert
    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
