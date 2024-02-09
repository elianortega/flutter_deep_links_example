import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const App());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'details/:itemId',
          builder: (context, state) => DetailsScreen(
            id: state.pathParameters['itemId']!,
          ),
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(child: Text('Details of item #$id')),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Links example'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          onTap: () => context.go('/details/$index'),
          title: Text('Item #$index'),
        ),
        separatorBuilder: (_, __) => Divider(
          height: 0.5,
          color: Colors.grey.shade300,
        ),
        itemCount: 15,
      ),
    );
  }
}
