import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  final String id;
  final String url;
  final String value;

  const JokeEntity({required this.id, required this.url, required this.value});

  static JokeEntity fromJson(Map<String, dynamic> json) {
    return JokeEntity(id: json["id"], url: json["url"], value: json["value"]);
  }

  @override
  List<Object?> get props => [id, url, value];
}
