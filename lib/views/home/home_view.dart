import 'package:flutter/material.dart';
import 'package:taski_todo/widgets/title_widget.dart';
import 'package:taski_todo/widgets/card_task_widget.dart';
import 'package:taski_todo/widgets/header_widget.dart';
import 'package:taski_todo/widgets/bottom_nav_bar_widget.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/task_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context
        .watch<TaskViewModel>()
        .tasks
        .where((task) => !task.isCompleted)
        .toList();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            const SizedBox(height: 36),
            TitleWidget(name: "Raffaela", taskCount: tasks.length),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CardTask(
                      title: task.title,
                      description: task.description,
                      isCompleted: task.isCompleted,
                      onToggleCompletion: () {
                        context.read<TaskViewModel>().toggleCompletion(task);
                      },
                      onDelete: () {
                        context.read<TaskViewModel>().deleteTask(task);
                      },
                      showMoreIcon: true,
                      isDoneView: true,
                    ),
                  );
                },
              ),
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
