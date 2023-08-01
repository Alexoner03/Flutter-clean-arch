import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

part 'joke_state.freezed.dart';

@freezed
abstract class JokeState with _$JokeState {
  const factory JokeState.initial() = Initial;
  const factory JokeState.loading() = Loading;
  const factory JokeState.error(Failure f) = Error;
  const factory JokeState.success(JokeEntity j) = Sucess;
}