import 'package:flutter/material.dart';
import 'package:taski_todo/core/app_text_styles.dart';
import 'package:taski_todo/widgets/bottom_nav_bar_widget.dart';
import 'package:taski_todo/widgets/done_task_list.dart';
import 'package:taski_todo/widgets/header_widget.dart';

import '../../widgets/delete_all_widget.dart';

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
        child: Column(
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Completed Tasks",
                  style: AppTextStyles.title,
                ),
                const DeleteAllButton(),
              ],
            ),
            const SizedBox(height: 36),
            const DoneTaskList(),
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
