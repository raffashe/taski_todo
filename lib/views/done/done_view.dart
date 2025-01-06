import 'package:flutter/material.dart';
import 'package:taski_todo/widgets/bottom_nav_bar_widget.dart';

import '../../widgets/header_widget.dart';

class DoneView extends StatefulWidget {
  const DoneView({super.key});

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(26.0),
        child: Center(
            child: Column(
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
          ],
        )),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
