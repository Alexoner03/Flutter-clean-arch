import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_linea1/Jokes/domain/use_cases/get_joke.dart';
import 'package:poc_linea1/Jokes/presentation/providers/jokes/joke_state.dart';

class GetJokeNotifier extends StateNotifier<JokeState> {

  final GetJokeUseCase _getJokeUseCase;

  GetJokeNotifier({
    required GetJokeUseCase getJokeUseCase
  }): _getJokeUseCase = getJokeUseCase, super(const JokeState.initial());

  void reset() => state = const JokeState.initial();

  Future<void> getJoke() async {
    state = const JokeState.loading();

    final result = await _getJokeUseCase();

    result.fold(
        (failure) => state = JokeState.error(failure),
        (jokeEntity) => state = JokeState.success(jokeEntity)
    );
  }

}