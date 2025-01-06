import 'package:flutter/material.dart';

import 'package:taski_todo/widgets/bottom_nav_bar_widget.dart';

import '../../widgets/header_widget.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});
  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  int _selectedIndex = 1;

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
        child: Column(
          children: [
            Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
