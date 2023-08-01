import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_linea1/Jokes/domain/entities/joke_entity.dart';
import 'package:poc_linea1/Jokes/presentation/providers/jokes/get_joke/get_joke_provider.dart';
import 'package:poc_linea1/Shared/utils/failure.dart';

class JokesScreen extends ConsumerStatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  static const name = 'jokes_screen';

  @override
  JokesScreenState createState() => JokesScreenState();
}

class JokesScreenState extends ConsumerState<JokesScreen> {
  String? joke;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getJokeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("JokesAPP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(joke ?? ""),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      ref.watch(getJokeNotifierProvider.notifier).getJoke();
                    },
                    //Assess provider status
                    child: state.when(
                        initial: () => const Text("Get Joke"),
                        loading: () {
                          return const CircularProgressIndicator(
                              color: Colors.white);
                        },
                        error: (Failure failure) {
                          if (failure.message.isNotEmpty) {
                            setState(() {
                              joke = failure.message;
                            });
                          }
                          return const Text("Get Joke");
                        },
                        success: (JokeEntity jokeEntity) {
                          setState(() {
                            joke = jokeEntity.value;
                          });
                          return const Text("Get Joke");
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }

}
