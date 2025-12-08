import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:get/get.dart';

/// Controller using GetX
class BottomNavController extends GetxController {
  // selected tab index (0..4)
  var selected = 0.obs;

  void changeTab(int i) => selected.value = i;
}

/// The animated bottom navigation widget (Option 2: single dynamic painter)
class AnimatedBottomNav extends StatelessWidget {
  const AnimatedBottomNav({super.key});

  static const int tabCount = 5;
  static const double barHeight = 110;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();
    return Obx(() {
      final selectedIndex = controller.selected.value;
      // fraction between 0 and 1
      final fraction = selectedIndex / (tabCount - 1);
      return SizedBox(
        height: barHeight,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: fraction, end: fraction),
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeOutCubic,
          builder: (context, animatedFraction, child) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                // Painted background with dynamic bump center
                Positioned.fill(
                  child: CustomPaint(
                    painter: _DynamicPainter(bumpFraction: animatedFraction),
                  ),
                ),
                Positioned.fill(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final w = constraints.maxWidth;
                    // Calculate center x for the bump — stays within padding from edges
                    final leftPadding = 20.0;
                    final rightPadding = 20.0;
                    final usable = w - leftPadding - rightPadding;
                    final centerX = leftPadding + usable * animatedFraction;
                    final glowSize = 82.0;
                    final glowLeft = (centerX - glowSize / 2).clamp(0.0, w - glowSize);
                    return Positioned(
                      left: glowLeft,
                      top: -32,
                      child: IgnorePointer(
                        child: Container(
                          height: glowSize,
                          width: glowSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // Radial gradient for glow
                            gradient: RadialGradient(
                              center: const Alignment(0.0, -0.2),
                              radius: 0.8,
                              colors: [
                                Colors.white.withOpacity(0.95),
                                const Color(0xFFE5007A).withOpacity(0.08),
                                const Color(0xFFE5007A).withOpacity(0.01),
                              ],
                              stops: const [0.0, 0.14, 1.0],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                // The icons and labels (Row)
                Positioned.fill(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final w = constraints.maxWidth;
                    final leftPadding = 20.0;
                    final rightPadding = 20.0;
                    final usable = w - leftPadding - rightPadding;
                    final perItem = usable / tabCount;

                    List<Widget> items = [];
                    final icons = [
                      Icons.home_outlined,
                      Icons.language_outlined,
                      Icons.layers_outlined,
                      Icons.video_collection_outlined,
                      Icons.person_outline,
                    ];
                    final labels = ["Home", "Community", "Library", "Reel", "Profile"];

                    for (int i = 0; i < tabCount; i++) {
                      final isSelected = controller.selected.value == i;
                      final centerX = leftPadding + perItem * i + perItem / 2;

                      // For vertical offset, lift the selected icon a bit
                      final verticalOffset = isSelected ? -18.0 : 0.0;

                      items.add(Positioned(
                        left: centerX - perItem / 2,
                        top: 18 + verticalOffset,
                        width: perItem,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => controller.changeTab(i),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedScale(
                                scale: isSelected ? 1.55 : 1.0,
                                duration: const Duration(milliseconds: 320),
                                curve: Curves.easeOutBack,
                                child: Icon(
                                  icons[i],
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                labels[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    }

                    return Stack(children: items);
                  }),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}

/// Custom painter that draws the gradient bar and a bump whose center
/// is controlled by bumpFraction (0..1).
class _DynamicPainter extends CustomPainter {
  final double bumpFraction;
  _DynamicPainter({required this.bumpFraction});

  final double bumpWidth = 130;     // bump width
  final double bumpDepth = 48;      // upward depth of bump
  final double topBarHeight = 42;   // flat top area

  @override
  void paint(Canvas canvas, Size size) {
    final leftPad = 20.0;
    final rightPad = 20.0;

    final usableWidth = size.width - leftPad - rightPad;
    final cx = leftPad + usableWidth * bumpFraction;

    final bumpL = cx - bumpWidth / 2;
    final bumpR = cx + bumpWidth / 2;

    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFF5C0FFF), Color(0xFFE5007A)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // Start
    path.moveTo(0, topBarHeight);

    // Left to bump start
    path.lineTo(bumpL, topBarHeight);

    // Bump curve — smooth & perfect
    path.cubicTo(
      bumpL + bumpWidth * 0.10, topBarHeight - bumpDepth * 0.55,
      cx - bumpWidth * 0.20, topBarHeight - bumpDepth,
      cx, topBarHeight - bumpDepth,
    );

    path.cubicTo(
      cx + bumpWidth * 0.20, topBarHeight - bumpDepth,
      bumpR - bumpWidth * 0.10, topBarHeight - bumpDepth * 0.55,
      bumpR, topBarHeight,
    );

    // Right side
    path.lineTo(size.width, topBarHeight);

    // Down & close
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Main background
    canvas.drawPath(path, paint);

    // TOP gloss effect
    final gloss = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withOpacity(0.13),
          Colors.white.withOpacity(0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, 60));

    canvas.drawPath(path, gloss);

    // Soft bump shadow (depth illusion)
    final shadow = Paint()
      ..color = Colors.black.withOpacity(0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final shadowPath = Path();
    shadowPath.moveTo(bumpL, topBarHeight + 6);
    shadowPath.quadraticBezierTo(
      cx,
      topBarHeight + bumpDepth * 0.55,
      bumpR,
      topBarHeight + 6,
    );
    shadowPath.lineTo(bumpR, topBarHeight + 26);
    shadowPath.lineTo(bumpL, topBarHeight + 26);
    shadowPath.close();

    canvas.drawPath(shadowPath, shadow);
  }

  @override
  bool shouldRepaint(covariant _DynamicPainter oldDelegate) =>
      oldDelegate.bumpFraction != bumpFraction;
}

