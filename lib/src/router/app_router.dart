import 'package:go_router/go_router.dart';
import 'package:prueba_pragma/src/screens/home/cats_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: CatsScreen.name,
      builder: (context, state) => const CatsScreen(),
    ),
  ]
);