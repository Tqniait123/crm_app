import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for HapticFeedback
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum ButtonType { fullyRounded, withAngel }

class CustomIconButton extends StatefulWidget {
  final Color color;
  final String iconAsset;
  final Color? iconColor;
  final Color? borderColor;
  final bool isBordered;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final BoxShadow? boxShadow;
  final double radius;
  final bool hasOvalBackground;
  final Gradient? ovalGradient;
  final double? ovalWidth;
  final double? ovalHeight;
  final ButtonType buttonType;

  const CustomIconButton({
    super.key,
    required this.color,
    required this.iconAsset,
    required this.onPressed,
    this.iconColor,
    this.borderColor,
    this.isBordered = false,
    this.width = 44.0,
    this.height = 44.0,
    this.radius = 50.0,
    this.boxShadow,
    this.hasOvalBackground = true,
    this.ovalGradient,
    this.ovalWidth,
    this.ovalHeight,
    this.buttonType = ButtonType.fullyRounded,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  double _scale = 1.0;
  double _opacity = 1.0;

  void _onTapDown() {
    HapticFeedback.lightImpact(); // ✨ haptic feedback
    setState(() {
      _scale = 0.92;
      _opacity = 0.6;
    });
  }

  void _onTapUp() {
    setState(() {
      _scale = 1.0;
      _opacity = 1.0;
    });
  }

  void _onTapCancel() {
    _onTapUp();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onLongPress: widget.onPressed,
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Oval background
              if (widget.hasOvalBackground)
                Container(
                  width: widget.ovalWidth ?? (widget.width.w * 0.9),
                  height: widget.ovalHeight ?? (widget.height.h * 1.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient:
                        widget.ovalGradient ??
                        LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Color(0xFFFF6B6B).withOpacity(0.8),
                          ],
                          // stops: [0.0, 0.4, 0.7, 1.0],
                        ),
                  ),
                ),
              // Main button with InkWell for ripple
              Material(
                color: Colors.transparent,
                borderRadius: widget.buttonType == ButtonType.fullyRounded
                    ? BorderRadius.circular(widget.radius)
                    : BorderRadiusDirectional.only(
                        topStart: Radius.circular(10),
                        topEnd: Radius.circular(widget.radius),
                        bottomStart: Radius.circular(widget.radius),
                        bottomEnd: Radius.circular(widget.radius),
                      ),
                child: InkWell(
                  borderRadius: widget.buttonType == ButtonType.fullyRounded
                      ? BorderRadius.circular(widget.radius)
                      : BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(widget.radius),
                          bottomLeft: Radius.circular(widget.radius),
                          bottomRight: Radius.circular(widget.radius),
                        ),
                  onTap: widget.onPressed,
                  onTapDown: (_) => _onTapDown(),
                  onTapCancel: _onTapCancel,
                  splashColor: Colors.white.withOpacity(0.2), // ripple
                  highlightColor: Colors.white.withOpacity(0.1), // subtle press
                  child: Container(
                    width: widget.width.w,
                    height: widget.height.h,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: widget.buttonType == ButtonType.fullyRounded
                          ? BorderRadius.circular(widget.radius)
                          : BorderRadiusDirectional.only(
                              topStart: Radius.circular(10),
                              topEnd: Radius.circular(widget.radius),
                              bottomStart: Radius.circular(widget.radius),
                              bottomEnd: Radius.circular(widget.radius),
                            ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        height: 20.r,
                        width: 20.r,
                        widget.iconAsset,
                        colorFilter: widget.iconColor != null
                            ? ColorFilter.mode(widget.iconColor!, BlendMode.srcIn)
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
