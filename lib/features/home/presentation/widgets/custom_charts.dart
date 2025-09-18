import 'dart:math' as math;

import 'package:flutter/material.dart';

// Leads Bar Chart Widget
class LeadsBarChart extends StatelessWidget {
  const LeadsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Bar heights based on the CSS design
    final barHeights = [35.0, 58.0, 48.0, 59.0, 28.0, 74.0];

    return SizedBox(
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (int i = 0; i < barHeights.length; i++)
            Container(
              width: 18,
              height: barHeights[i],
              decoration: BoxDecoration(
                color: i == barHeights.length - 1 ? const Color(0xFFE92929) : const Color(0xFFE92929).withOpacity(0.2),
                borderRadius: BorderRadius.circular(i == barHeights.length - 1 ? 11.5 : 10),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), offset: const Offset(4, 4), blurRadius: 12),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// Properties Bottle Chart Widget
class PropertiesBottleChart extends StatefulWidget {
  const PropertiesBottleChart({super.key});

  @override
  State<PropertiesBottleChart> createState() => _PropertiesBottleChartState();
}

class _PropertiesBottleChartState extends State<PropertiesBottleChart> with TickerProviderStateMixin {
  late AnimationController _waveController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _waveController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // First bottle - full with animated liquid
          _buildBottle(fillRatio: 1.0, isAnimated: true),
          const SizedBox(width: 9),

          // Second bottle - 64% filled with animated liquid
          _buildBottle(fillRatio: 0.64, isAnimated: true),
          const SizedBox(width: 9),

          // Third bottle - 64% filled with animated liquid
          _buildBottle(fillRatio: 0.64, isAnimated: true),
          const SizedBox(width: 9),

          // Fourth bottle - empty
          _buildBottle(fillRatio: 0.0, isAnimated: false),
        ],
      ),
    );
  }

  Widget _buildBottle({required double fillRatio, required bool isAnimated}) {
    return AnimatedBuilder(
      animation: _waveAnimation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(28, 47),
          painter: BottlePainter(
            fillRatio: fillRatio,
            waveOffset: isAnimated ? _waveAnimation.value : 0.0,
            isAnimated: isAnimated,
          ),
        );
      },
    );
  }
}

class BottlePainter extends CustomPainter {
  final double fillRatio;
  final double waveOffset;
  final bool isAnimated;

  BottlePainter({required this.fillRatio, required this.waveOffset, required this.isAnimated});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Create bottle shape path (narrower at bottom)
    final bottlePath = Path();
    const double topWidth = 28.0;
    const double bottomWidth = 20.0; // Narrower at bottom
    const double radius = 4.0;

    // Create trapezoid-like bottle shape
    bottlePath.moveTo(radius, 0);
    bottlePath.lineTo(topWidth - radius, 0);
    bottlePath.arcToPoint(Offset(topWidth, radius), radius: const Radius.circular(radius));

    // Right side sloping inward
    bottlePath.lineTo(topWidth - (topWidth - bottomWidth) / 2, size.height - radius);
    bottlePath.arcToPoint(
      Offset(topWidth - (topWidth - bottomWidth) / 2 - radius, size.height),
      radius: const Radius.circular(radius),
    );

    // Bottom
    bottlePath.lineTo((topWidth - bottomWidth) / 2 + radius, size.height);
    bottlePath.arcToPoint(
      Offset((topWidth - bottomWidth) / 2, size.height - radius),
      radius: const Radius.circular(radius),
    );

    // Left side sloping inward
    bottlePath.lineTo(0, radius);
    bottlePath.arcToPoint(const Offset(radius, 0), radius: const Radius.circular(radius));
    bottlePath.close();

    // Draw bottle background
    paint.color = const Color(0xFFE92929).withOpacity(0.09);
    canvas.drawPath(bottlePath, paint);

    if (fillRatio > 0) {
      // Create liquid fill path
      final liquidPath = Path();
      final fillHeight = size.height * fillRatio;
      final liquidTop = size.height - fillHeight;

      // Calculate width at the liquid top level
      final widthAtTop = bottomWidth + (topWidth - bottomWidth) * (fillHeight / size.height);

      if (isAnimated && fillRatio > 0) {
        // Create wavy liquid surface
        liquidPath.moveTo((topWidth - widthAtTop) / 2, liquidTop);

        for (double x = (topWidth - widthAtTop) / 2; x <= topWidth - (topWidth - widthAtTop) / 2; x += 2) {
          final waveHeight = 2.0 * (1 + 0.3 * math.sin(waveOffset * 2 * math.pi + x * 0.3));
          liquidPath.lineTo(x, liquidTop + waveHeight);
        }
      } else {
        liquidPath.moveTo((topWidth - widthAtTop) / 2, liquidTop);
        liquidPath.lineTo(topWidth - (topWidth - widthAtTop) / 2, liquidTop);
      }

      // Right side of liquid
      liquidPath.lineTo(topWidth - (topWidth - bottomWidth) / 2, size.height - radius);
      liquidPath.arcToPoint(
        Offset(topWidth - (topWidth - bottomWidth) / 2 - radius, size.height),
        radius: const Radius.circular(radius),
      );

      // Bottom of liquid
      liquidPath.lineTo((topWidth - bottomWidth) / 2 + radius, size.height);
      liquidPath.arcToPoint(
        Offset((topWidth - bottomWidth) / 2, size.height - radius),
        radius: const Radius.circular(radius),
      );

      // Left side of liquid
      liquidPath.lineTo((topWidth - widthAtTop) / 2, liquidTop);
      liquidPath.close();

      // Draw liquid with gradient effect
      final liquidRect = Rect.fromLTWH(0, liquidTop, size.width, fillHeight);
      paint.shader = null;
      paint.color = const Color(0xFFE92929); // Solid red
      canvas.drawPath(liquidPath, paint);

      // Add shimmer effect for animation
      if (isAnimated && fillRatio > 0) {
        paint.shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.0), Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.0)],
          stops: [0.0, waveOffset, 1.0],
        ).createShader(liquidRect);

        canvas.drawPath(liquidPath, paint);
      }
    }

    // Draw bottle outline
    paint.shader = null;
    paint.style = PaintingStyle.stroke;
    paint.color = const Color(0xFFE92929).withOpacity(0.0);
    paint.strokeWidth = 1.0;
    canvas.drawPath(bottlePath, paint);
  }

  @override
  bool shouldRepaint(covariant BottlePainter oldDelegate) {
    return oldDelegate.fillRatio != fillRatio ||
        oldDelegate.waveOffset != waveOffset ||
        oldDelegate.isAnimated != isAnimated;
  }
}


