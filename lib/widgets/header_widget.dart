import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski_todo/core/app_text_styles.dart';

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
    return Padding(
      padding: const EdgeInsets.all(26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/taski_logo.svg',
            semanticsLabel: 'Taski Logo',
            height: 32,
          ),
          Row(
            children: [
              Text(
                'Welcome, $userName',
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
      ),
    );
  }
}
