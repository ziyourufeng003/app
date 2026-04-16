import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// 首页 — 功能入口大厅
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding + 16,
            left: 20,
            right: 20,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部问候
              const Text(
                '你好，音乐人',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              // 搜索栏
              _SearchBar(),
              const SizedBox(height: 28),
              // 功能入口标题
              const Text(
                '常用工具',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 14),
              // 4个功能卡片 2x2
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _FeatureCard(
                    icon: Icons.tune,
                    title: '调音器',
                    subtitle: '精准调音助手',
                    accentColor: Color(0xFFE8B86D),
                  ),
                  _FeatureCard(
                    icon: Icons.speed,
                    title: '节拍器',
                    subtitle: '稳定节奏训练',
                    accentColor: Color(0xFF7EB8DA),
                  ),
                  _FeatureCard(
                    icon: Icons.edit_note,
                    title: '简谱制谱',
                    subtitle: '快速编写简谱',
                    accentColor: Color(0xFFA8C97D),
                  ),
                  _FeatureCard(
                    icon: Icons.library_music,
                    title: '乐谱库',
                    subtitle: '海量曲谱资源',
                    accentColor: Color(0xFFD4A0C0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 搜索栏
class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(12),
        // 拟物化内凹阴影
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          // 内侧高光
          BoxShadow(
            color: Colors.white.withAlpha(200),
            blurRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          Icon(Icons.search, size: 20, color: AppColors.inactive),
          const SizedBox(width: 8),
          Text(
            '搜索乐谱、工具...',
            style: TextStyle(fontSize: 14, color: AppColors.inactive),
          ),
        ],
      ),
    );
  }
}

/// 功能入口卡片 — 拟物化白色风格
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(16),
        // 拟物化：底部暗影 + 顶部高光
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.white.withAlpha(220),
            blurRadius: 0,
            offset: const Offset(0, -1),
          ),
        ],
        // 微妙边框
        border: Border.all(
          color: AppColors.cardBorder,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 图标容器 — 拟物化凸起按钮
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withAlpha(40),
                    accentColor.withAlpha(20),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withAlpha(30),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: accentColor.withAlpha(60),
                  width: 1,
                ),
              ),
              child: Icon(icon, size: 22, color: accentColor),
            ),
            const Spacer(),
            // 标题
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            // 副标题
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
