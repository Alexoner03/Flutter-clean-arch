import 'package:dartz/dartz.dart';
import 'package:poc_linea1/Jokes/domain/datasources/remote/jokes_remote_datasource.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Jokes/domain/repositories/jokes_remote_repository.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

class JokesRemoteRepository implements IJokesRemoteRepository {

  final IJokesRemoteDatasource remoteDatasource;

  JokesRemoteRepository({required this.remoteDatasource});

  @override
  Future<Either<Failure, JokeEntity>> getJoke() async => await remoteDatasource.get();

}