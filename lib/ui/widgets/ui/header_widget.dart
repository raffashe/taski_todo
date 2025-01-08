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
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Text(
              "Taski",
              style: AppTextStyles.title(context),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "$userName",
              style: AppTextStyles.title(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.05,
              backgroundImage: const AssetImage('assets/usuario.jpeg'),
              backgroundColor: Colors.grey[200],
            ),
          ],
        ),
      ],
    );
  }
}
