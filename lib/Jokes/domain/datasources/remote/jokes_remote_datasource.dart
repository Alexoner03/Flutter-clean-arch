import 'package:dartz/dartz.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

abstract class IJokesRemoteDatasource {
  Future<Either<Failure,JokeEntity>> get();
}