import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicatorWidget({super.key, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Light background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          totalPages,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: totalPages > 4 ? 2 : 3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: index == currentPage ? 8 : 6,
              height: index == currentPage ? 8 : 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == currentPage ? Colors.black : Colors.black.withOpacity(0.3), // Dark dots
                boxShadow: index == currentPage
                    ? [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))]
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
