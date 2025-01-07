import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
import 'package:taski_todo/ui/widgets/nav/bottom_nav_bar_widget.dart';
import 'package:taski_todo/ui/widgets/done/done_task_list.dart';
import 'package:taski_todo/ui/widgets/ui/header_widget.dart';
import '../../widgets/done/delete_all_widget.dart';
import '../../../data/viewmodel/task_viewmodel.dart';

class DoneView extends StatefulWidget {
  const DoneView({super.key});

  @override
  State<DoneView> createState() => _DoneViewState();
}

class _DoneViewState extends State<DoneView> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    final completedTasks = context.watch<TaskViewModel>().completedTasks;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            const SizedBox(height: 32),
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
            completedTasks.isEmpty
                ? Center(
                    child: Text(
                      'No completed tasks.',
                      style: AppTextStyles.subtitle,
                    ),
                  )
                : const DoneTaskList(),
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
