import 'package:flutter/material.dart';
import '../../widgets/header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
