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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            SizedBox(height: screenHeight * 0.04),
            TitleWidget(name: "Raffaela", taskCount: tasks.length),
            SizedBox(height: screenHeight * 0.02),
            tasks.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.2),
                      SvgPicture.asset(
                        'assets/no_found.svg',
                        semanticsLabel: 'Taski Logo',
                        height: screenWidth * 0.25,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'You have no task listed.',
                        style: AppTextStyles.subtitle(context),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const CreateButton(),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
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
