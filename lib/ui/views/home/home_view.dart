import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
import 'package:taski_todo/ui/widgets/ui/title_widget.dart';
import 'package:taski_todo/ui/widgets/ui/card_task_widget.dart';
import 'package:taski_todo/ui/widgets/ui/header_widget.dart';
import 'package:taski_todo/ui/widgets/nav/bottom_nav_bar_widget.dart';
import '../../../data/viewmodel/task_viewmodel.dart';
import '../../widgets/nav/create_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

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
            tasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200),
                      SvgPicture.asset(
                        'assets/no_found.svg',
                        semanticsLabel: 'Taski Logo',
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'You have no task listed.',
                        style: AppTextStyles.subtitle,
                      ),
                      const SizedBox(height: 16),
                      const CreateButton(),
                    ],
                  )
                : Expanded(
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
                              context
                                  .read<TaskViewModel>()
                                  .toggleCompletion(task);
                            },
                            onDelete: () {
                              context
                                  .read<TaskViewModel>()
                                  .deleteTask(task, context);
                            },
                            showMoreIcon: true,
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
