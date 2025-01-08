import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/ui/widgets/nav/bottom_nav_bar_widget.dart';
import 'package:taski_todo/ui/widgets/ui/card_task_widget.dart';
import 'package:taski_todo/ui/widgets/ui/header_widget.dart';
import 'package:taski_todo/core/utils/dialog_utils.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/viewmodel/search_Input_viewmodel.dart';
import '../../../data/viewmodel/task_viewmodel.dart';
import '../../widgets/search/search_input_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int _selectedIndex = 2;
  final TextEditingController _textController = TextEditingController();

  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(screenWidth * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            SizedBox(height: screenHeight * 0.04),
            SearchInput(
              textController: _textController,
              hintText: 'Search',
              onChanged: (query) {
                final viewModel = context.read<SearchInputViewModel>();
                viewModel.updateText(query);
              },
            ),
            SizedBox(height: screenHeight * 0.04),
            Expanded(
              child: Consumer<TaskViewModel>(
                builder: (context, taskViewModel, child) {
                  final searchQuery =
                      context.watch<SearchInputViewModel>().text;

                  if (searchQuery.isEmpty) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/search.svg',
                          semanticsLabel: 'Taski Logo',
                          height: screenWidth * 0.3,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Do a search to see the tasks.",
                          style: AppTextStyles.subtitle(context),
                        ),
                      ],
                    ));
                  }

                  final filteredTasks = taskViewModel.searchTasks(searchQuery);

                  return filteredTasks.isEmpty
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/no_found.svg',
                              semanticsLabel: 'Taski Logo',
                              height: screenWidth * 0.25,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              "No result found",
                              style: AppTextStyles.subtitle(context),
                            ),
                          ],
                        ))
                      : ListView.builder(
                          itemCount: filteredTasks.length,
                          itemBuilder: (context, index) {
                            final task = filteredTasks[index];
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: CardTask(
                                title: task.title,
                                description: task.description,
                                isCompleted: task.isCompleted,
                                onToggleCompletion: () {
                                  taskViewModel.toggleCompletion(task);
                                },
                                onDelete: () {
                                  showDeleteConfirmationDialog(
                                    context,
                                    task,
                                    () {
                                      taskViewModel.deleteTask(task, context);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                showMoreIcon: !task.isCompleted,
                              ),
                            );
                          },
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
