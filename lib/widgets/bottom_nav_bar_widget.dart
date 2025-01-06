import 'package:flutter/material.dart';
import 'package:taski_todo/core/app_colors.dart';
import 'package:taski_todo/core/app_routes.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: currentIndex,
      onTap: (int index) {
        /// Chama a função de tap para definir o estado
        onTap(index);

        /// Navega para a rota correta usando pushReplacementNamed para evitar empilhamento de páginas
        switch (index) {
          case 0:
            if (currentIndex != 0) {
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
            break;
          case 1:
            if (currentIndex != 1) {
              Navigator.pushReplacementNamed(context, AppRoutes.createTask);
            }
            break;
          case 2:
            if (currentIndex != 2) {
              Navigator.pushReplacementNamed(context, AppRoutes.search);
            }
            break;
          case 3:
            if (currentIndex != 3) {
              Navigator.pushReplacementNamed(context, AppRoutes.done);
            }
            break;
        }
      },
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.mutedAzure,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_box_outlined),
          label: 'Done',
        ),
      ],
    );
  }
}
