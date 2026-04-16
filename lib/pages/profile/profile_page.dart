import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 我的页面（占位）
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Center(
        child: Text('我的', style: TextStyle(color: AppColors.textPrimary)),
      ),
    );
  }
}
