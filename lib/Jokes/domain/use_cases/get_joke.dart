import 'package:dartz/dartz.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Jokes/domain/repositories/jokes_remote_repository.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

class GetJokeUseCase {
  final IJokesRemoteRepository jokesRemoteRepository;

  GetJokeUseCase({required this.jokesRemoteRepository});


  Future<Either<Failure, JokeEntity>> call() async {

    final jokeResponse = await jokesRemoteRepository.getJoke();
    final jokeFolded = jokeResponse.fold((failure) => failure, (joke) => joke);

    if(jokeResponse.isLeft()) {
      return Left(jokeFolded as Failure);
    }

    return Right(jokeFolded as JokeEntity);

  }
}