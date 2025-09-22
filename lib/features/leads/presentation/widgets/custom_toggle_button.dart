import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

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
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: widget.animationDuration, vsync: this);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

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
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final animationValue = isFirst ? _animation.value : (1 - _animation.value);

          return AnimatedContainer(
            duration: widget.animationDuration,
            curve: Curves.easeInOut,
            padding: widget.itemPadding,
            decoration: BoxDecoration(
              color: isSelected ? widget.selectedBackgroundColor : Colors.transparent,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: isSelected
                  ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
                  : null,
            ),
            child: Transform.scale(
              scale: 0.9 + (animationValue * 0.1), // Subtle scale animation
              child: icon.icon(color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor),
            ),
          );
        },
      ),
    );
  }
}

// Alternative version with more customization options
class AdvancedCustomToggleButton<T> extends StatefulWidget {
  final T selectedValue;
  final List<ToggleItem<T>> items;
  final Function(T) onChanged;
  final Duration animationDuration;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry itemPadding;
  final double spacing;
  final bool showShadow;

  const AdvancedCustomToggleButton({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.animationDuration = const Duration(milliseconds: 200),
    this.backgroundColor = const Color(0xffF2F2F2),
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.unselectedItemColor = Colors.grey,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(4),
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
    this.spacing = 10.0,
    this.showShadow = true,
  });

  @override
  State<AdvancedCustomToggleButton<T>> createState() => _AdvancedCustomToggleButtonState<T>();
}

class _AdvancedCustomToggleButtonState<T> extends State<AdvancedCustomToggleButton<T>> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.items.length,
      (index) => AnimationController(duration: widget.animationDuration, vsync: this),
    );
    _animations = _controllers
        .map((controller) => CurvedAnimation(parent: controller, curve: Curves.easeInOut))
        .toList();

    _updateAnimations();
  }

  void _updateAnimations() {
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.items[i].value == widget.selectedValue) {
        _controllers[i].forward();
      } else {
        _controllers[i].reverse();
      }
    }
  }

  @override
  void didUpdateWidget(AdvancedCustomToggleButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      _updateAnimations();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = item.value == widget.selectedValue;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index > 0) SizedBox(width: widget.spacing),
              GestureDetector(
                onTap: () => widget.onChanged(item.value),
                child: AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return AnimatedContainer(
                      duration: widget.animationDuration,
                      curve: Curves.easeInOut,
                      padding: widget.itemPadding,
                      decoration: BoxDecoration(
                        color: isSelected ? widget.selectedBackgroundColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        boxShadow: isSelected && widget.showShadow
                            ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Transform.scale(
                        scale: 0.9 + (_animations[index].value * 0.1),
                        child:
                            item.child ??
                            item.icon.icon(color: isSelected ? widget.selectedItemColor : widget.unselectedItemColor),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
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
