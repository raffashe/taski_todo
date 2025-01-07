import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';

class Header extends StatelessWidget {
  final String userName;
  final String avatarUrl;

  const Header({
    super.key,
    required this.userName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/taski_icon.svg',
              semanticsLabel: 'Taski Logo',
              height: 32,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Taski",
              style: AppTextStyles.title,
            )
          ],
        ),
        Row(
          children: [
            Text(
              "$userName",
              style: AppTextStyles.title,
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 20,
              backgroundImage: const AssetImage('assets/usuario.jpeg'),
              backgroundColor: Colors.grey[200],
            ),
          ],
        ),
      ],
    );
  }
}
