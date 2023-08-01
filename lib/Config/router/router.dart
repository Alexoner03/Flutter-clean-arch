import 'package:go_router/go_router.dart';
import 'package:poc_linea1/Jokes/presentation/screens/jokes/jokes_screen.dart';
import 'package:poc_linea1/Jokes/presentation/screens/loading/loading_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: LoadingScreen.name,
        builder: (context, state) => const LoadingScreen()
    ),
    GoRoute(
        path: '/jokes',
        name: JokesScreen.name,
        builder: (context, state) => const JokesScreen()
    ),
]);

