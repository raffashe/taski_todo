import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski_todo/core/constants/app_colors.dart';
import 'package:taski_todo/core/constants/app_routes.dart';
import '../../views/create/create_task_view.dart';

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
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 46.50, vertical: 24.50),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFF5F6F9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(
            icon: 'assets/todo.svg',
            label: 'Todo',
            index: 0,
            isSelected: currentIndex == 0,
            onTap: onTap,
            context: context,
          ),
          const SizedBox(width: 48),
          _buildNavItem(
            icon: 'assets/create.svg',
            label: 'Create',
            index: 1,
            isSelected: currentIndex == 1,
            onTap: onTap,
            context: context,
            onTapAction: () {
              CreateTaskModal.show(context);
            },
          ),
          const SizedBox(width: 48),
          _buildNavItem(
            icon: 'assets/search_icon.svg',
            label: 'Search',
            index: 2,
            isSelected: currentIndex == 2,
            onTap: onTap,
            context: context,
          ),
          const SizedBox(width: 48),
          _buildNavItem(
            icon: 'assets/done.svg',
            label: 'Done',
            index: 3,
            isSelected: currentIndex == 3,
            onTap: onTap,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required bool isSelected,
    required Function(int) onTap,
    required BuildContext context,
    VoidCallback? onTapAction,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTapAction != null) {
          onTapAction();
        } else {
          onTap(index);
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, AppRoutes.home);
              break;
            case 2:
              Navigator.pushReplacementNamed(context, AppRoutes.search);
              break;
            case 3:
              Navigator.pushReplacementNamed(context, AppRoutes.done);
              break;
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              icon,
              semanticsLabel: '$label Icon',
              height: 24,
              colorFilter: isSelected
                  ? ColorFilter.mode(AppColors.blue, BlendMode.srcATop)
                  : ColorFilter.mode(AppColors.mutedAzure, BlendMode.srcATop),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.blue : AppColors.mutedAzure,
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
