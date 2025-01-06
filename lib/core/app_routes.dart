import 'package:flutter/material.dart';
import 'package:taski_todo/views/create/create_task_view.dart';

import '../views/done/done_view.dart';
import '../views/home/home_view.dart';
import '../views/search/search_view.dart';

class AppRoutes {
  /// Definição das rotas como constantes
  static const String home = '/home';
  static const String createTask = '/create';
  static const String search = '/search';
  static const String done = '/done';

  /// Método que gera as rotas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case createTask:
        return MaterialPageRoute(builder: (_) => const CreateTaskView());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchView());
      case done:
        return MaterialPageRoute(builder: (_) => const DoneView());
      default:
        return _errorRoute();
    }
  }

  /// Tela de erro para rotas inválidas
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
