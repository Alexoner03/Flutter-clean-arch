import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:poc_linea1/Jokes/domain/datasources/remote/jokes_remote_datasource.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

class JokesHttpDatasource implements IJokesRemoteDatasource {

  @override
  Future<Either<Failure, JokeEntity>> get() async {
    try {
      final url = Uri.https("icanhazdadjoke.com");
      final response = await http.get(url, headers: {
        "Accept" : "application/json"
      });

      if (response.statusCode >= 400) {
        return Left(Failure("Error Obteniendo El chiste :'v "));
      }

      Map<String, dynamic> responseDecoded = jsonDecode(response.body);

      return Right(
          JokeEntity(
              id: responseDecoded["id"],
              url: "",
              value: responseDecoded["joke"]
          )
      );
    }catch(e) {
      print(e);
      return Left(Failure("Error Obteniendo El chiste :'v "));
    }

  }

}