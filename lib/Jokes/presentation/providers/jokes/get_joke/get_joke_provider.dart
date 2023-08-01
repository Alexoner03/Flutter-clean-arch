import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_linea1/Jokes/domain/datasources/remote/jokes_remote_datasource.dart';
import 'package:poc_linea1/Jokes/domain/repositories/jokes_remote_repository.dart';
import 'package:poc_linea1/Jokes/domain/use_cases/get_joke.dart';
import 'package:poc_linea1/Jokes/infraestructure/datasources/remote/jokes_http_datasource.dart';
import 'package:poc_linea1/Jokes/infraestructure/repositories/remote/JokesRemoteRepository.dart';
import 'package:poc_linea1/Jokes/presentation/providers/jokes/get_joke/get_joke_notifier.dart';
import 'package:poc_linea1/Jokes/presentation/providers/jokes/joke_state.dart';

final _jokeRemoteDatasourceProvider = Provider<IJokesRemoteDatasource>((ref) => JokesHttpDatasource());

final _jokeRemoteRepositoryProvider = Provider<IJokesRemoteRepository>((ref){
  final remoteDatasource = ref.watch(_jokeRemoteDatasourceProvider);
  return JokesRemoteRepository(remoteDatasource: remoteDatasource);
});

final _getJokeUseCaseProvider = Provider<GetJokeUseCase>((ref){
  final remoteRepository = ref.watch(_jokeRemoteRepositoryProvider);
  return GetJokeUseCase(jokesRemoteRepository: remoteRepository);
});

final getJokeNotifierProvider = StateNotifierProvider<GetJokeNotifier, JokeState>((ref){
  final useCase = ref.watch(_getJokeUseCaseProvider);
  return GetJokeNotifier(getJokeUseCase: useCase);
});