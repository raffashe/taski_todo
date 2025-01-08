import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski_todo/core/constants/app_colors.dart';
import 'package:taski_todo/core/constants/app_routes.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenWidth * 0.28,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.10,
        vertical: screenWidth * 0.06,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: const Color(0xFFF5F6F9),
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
            screenWidth: screenWidth,
          ),
          SizedBox(width: screenWidth * 0.10),
          _buildNavItem(
            icon: 'assets/create.svg',
            label: 'Create',
            index: 1,
            isSelected: currentIndex == 1,
            onTap: onTap,
            context: context,
            screenWidth: screenWidth,
            onTapAction: () {
              CreateTaskModal.show(context);
            },
          ),
          SizedBox(width: screenWidth * 0.10),
          _buildNavItem(
            icon: 'assets/search_icon.svg',
            label: 'Search',
            index: 2,
            isSelected: currentIndex == 2,
            onTap: onTap,
            context: context,
            screenWidth: screenWidth,
          ),
          SizedBox(width: screenWidth * 0.10),
          _buildNavItem(
            icon: 'assets/done.svg',
            label: 'Done',
            index: 3,
            isSelected: currentIndex == 3,
            onTap: onTap,
            context: context,
            screenWidth: screenWidth,
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
    required double screenWidth,
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
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
            child: SvgPicture.asset(
              icon,
              semanticsLabel: '$label Icon',
              colorFilter: isSelected
                  ? ColorFilter.mode(AppColors.blue, BlendMode.srcATop)
                  : ColorFilter.mode(AppColors.mutedAzure, BlendMode.srcATop),
            ),
          ),
          SizedBox(height: screenWidth * 0.012),
          Text(
            label,
            style: AppTextStyles.subtitle(context).copyWith(
              color: isSelected ? AppColors.blue : AppColors.mutedAzure,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
