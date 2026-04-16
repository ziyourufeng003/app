import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../pages/home/home_page.dart';
import '../pages/library/library_page.dart';
import '../pages/composer/composer_page.dart';
import '../pages/metronome/metronome_page.dart';
import '../pages/profile/profile_page.dart';

/// 主框架 — 底部导航 + 页面切换
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  // 5个Tab对应的页面
  static const List<Widget> _pages = [
    HomePage(),
    LibraryPage(),
    ComposerPage(),
    MetronomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 安全区底部间距（iOS/鸿蒙刘海屏适配）
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Stack(
        children: [
          // 页面内容
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          // 底部导航栏
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _SkeuoNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
              bottomPadding: bottomPadding,
            ),
          ),
        ],
      ),
    );
  }
}

/// 拟物化底部导航栏
class _SkeuoNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double bottomPadding;

  const _SkeuoNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // 顶部高光线 — 模拟金属面板接缝
        border: Border(
          top: BorderSide(color: AppColors.navTopBorder, width: 0.5),
        ),
        // 白色磨砂渐变背景
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFAFAFA), // 顶部纯白
            Color(0xFFF2F2F2), // 底部微灰
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 导航项行
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildItem(0, Icons.home_outlined, Icons.home, '首页'),
                _buildItem(1, Icons.library_music_outlined, Icons.library_music, '乐谱库'),
                _buildCenterItem(2, Icons.edit_note, '制谱'),
                _buildItem(3, Icons.speed_outlined, Icons.speed, '节拍器'),
                _buildItem(4, Icons.person_outline, Icons.person, '我的'),
              ],
            ),
          ),
          // 底部安全区
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }

  /// 普通导航项
  Widget _buildItem(int index, IconData inactiveIcon, IconData activeIcon, String label) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 图标 — 选中态有金色光晕
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      // 外发光效果
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.activeGold.withAlpha(77),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    )
                  : null,
              child: Icon(
                isActive ? activeIcon : inactiveIcon,
                size: 24,
                color: isActive ? AppColors.activeGold : AppColors.inactive,
              ),
            ),
            const SizedBox(height: 3),
            // 标签文字
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isActive ? AppColors.activeGold : AppColors.inactive,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            // 选中指示小圆点
            if (isActive) ...[
              const SizedBox(height: 2),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.activeGold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 中心突出按钮 — 制谱
  Widget _buildCenterItem(int index, IconData icon, String label) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 突出的圆形按钮
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // 拟物化：多层阴影模拟凸起
              gradient: isActive
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE0E0E0), // 左上高光
                        Color(0xFFC8C8C8), // 右下暗面
                      ],
                    )
                  : const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFE8E8E8),
                        Color(0xFFD5D5D5),
                      ],
                    ),
              // 外投影 — 按钮浮起感
              boxShadow: [
                // 下层暗影
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
                // 上层高光
                BoxShadow(
                  color: Colors.white.withAlpha(180),
                  blurRadius: 2,
                  offset: const Offset(0, -1),
                ),
                // 选中时的金色光晕
                if (isActive)
                  BoxShadow(
                    color: AppColors.activeGold.withAlpha(102),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
              ],
              // 内凹边框 — 模拟金属边缘
              border: Border.all(
                color: isActive
                    ? AppColors.activeGold.withAlpha(180)
                    : Colors.white.withAlpha(200),
                width: 1.5,
              ),
            ),
            child: Icon(
              icon,
              size: 26,
              color: isActive ? AppColors.activeGold : AppColors.inactive,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? AppColors.activeGold : AppColors.inactive,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
