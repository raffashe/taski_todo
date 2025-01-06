import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taski_todo/widgets/bottom_nav_bar_widget.dart';
import 'package:taski_todo/widgets/card_task_widget.dart';
import 'package:taski_todo/widgets/header_widget.dart';
import 'package:taski_todo/utils/dialog_utils.dart';
import '../../viewmodel/task_viewmodel.dart';
import '../../viewmodel/search_input_viewmodel.dart';
import '../../widgets/search_input_widget';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int _selectedIndex = 2;
  final TextEditingController _textController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              userName: 'Raffaela',
              avatarUrl: 'assets/usuario.jpg',
            ),
            SizedBox(height: 32),
            SearchInput(
              textController: _textController,
              hintText: 'Search',
              onChanged: (query) {
                final viewModel = context.read<SearchInputViewModel>();
                viewModel.updateText(query);
              },
            ),
            const SizedBox(height: 16),
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
                          height: 200,
                        ),
                        Text("Do a search to see the tasks.")
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
                              height: 60,
                            ),
                            SizedBox(height: 20),
                            Text("No result found")
                          ],
                        ))
                      : ListView.builder(
                          itemCount: filteredTasks.length,
                          itemBuilder: (context, index) {
                            final task = filteredTasks[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
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
                                      taskViewModel.deleteTask(task);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                showMoreIcon: !task.isCompleted,
                                isDoneView: false,
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
