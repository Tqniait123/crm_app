import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomToggleButton extends StatefulWidget {
  final bool isSelected;
  final Function(bool) onToggle;
  final String firstIcon;
  final String secondIcon;
  final Duration animationDuration;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry itemPadding;
  final double spacing;

  const CustomToggleButton({
    super.key,
    required this.isSelected,
    required this.onToggle,
    this.firstIcon = '',
    this.secondIcon = '',
    this.animationDuration = const Duration(milliseconds: 200),
    this.backgroundColor = const Color(0xffF2F2F2),
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = AppColors.primary,
    this.unselectedItemColor = Colors.grey,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(4),
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.spacing = 10.0,
  });

  // Factory constructor with default icons from your original code
  factory CustomToggleButton.gridTable({
    Key? key,
    required bool isGridSelected,
    required Function(bool) onToggle,
    Duration animationDuration = const Duration(milliseconds: 200),
    Color backgroundColor = const Color(0xffF2F2F2),
    Color selectedBackgroundColor = Colors.white,
  }) {
    return CustomToggleButton(
      key: key,
      isSelected: isGridSelected,
      onToggle: onToggle,
      firstIcon: AppIcons.gridFillIc,
      secondIcon: AppIcons.tableFillIc,
      animationDuration: animationDuration,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
    );
  }

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: widget.animationDuration, vsync: this);

    if (widget.isSelected) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(CustomToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap(bool isFirst) {
    if ((isFirst && !widget.isSelected) || (!isFirst && widget.isSelected)) {
      HapticFeedback.lightImpact();
      widget.onToggle(!widget.isSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      height: 60,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleItem(
            icon: widget.firstIcon,
            isSelected: widget.isSelected,
            onTap: () => _handleTap(true),
            isFirst: true,
          ),
          SizedBox(width: widget.spacing),
          _buildToggleItem(
            icon: widget.secondIcon,
            isSelected: !widget.isSelected,
            onTap: () => _handleTap(false),
            isFirst: false,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required String icon,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isFirst,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
        padding: widget.itemPadding,
        decoration: BoxDecoration(
          color: isSelected ? widget.selectedBackgroundColor : widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: icon.icon(color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor),
      ),
    );
  }
}

class ToggleItem<T> {
  final T value;
  final String icon;
  final Widget? child;

  ToggleItem({required this.value, this.icon = '', this.child});
}

// Usage Examples:
/*

// Basic usage (replaces your original container)
class ExampleUsage extends StatefulWidget {
  @override
  State<ExampleUsage> createState() => _ExampleUsageState();
}

class _ExampleUsageState extends State<ExampleUsage> {
  bool isGridSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Simple grid/table toggle
          CustomToggleButton.gridTable(
            isGridSelected: isGridSelected,
            onToggle: (value) {
              setState(() {
                isGridSelected = value;
              });
            },
          ),

          SizedBox(height: 20),

          // Advanced multi-option toggle
          AdvancedCustomToggleButton<String>(
            selectedValue: 'grid',
            items: [
              ToggleItem(value: 'grid', icon: AppIcons.gridFillIc),
              ToggleItem(value: 'list', icon: AppIcons.tableFillIc),
              ToggleItem(value: 'card', icon: AppIcons.cardIc),
            ],
            onChanged: (value) {
              print('Selected: $value');
            },
          ),
        ],
      ),
    );
  }
}

*/
