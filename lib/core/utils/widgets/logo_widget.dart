import 'package:crm_app/core/extensions/widget_extensions.dart';
import 'package:crm_app/core/static/app_assets.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LogoType { svg, png, wide }

class LogoWidget extends StatelessWidget {
  final double? size;
  final LogoType type;
  final Color? color;

  const LogoWidget({super.key, this.size, this.type = LogoType.png, this.color});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: _buildLogo(),
      flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
        return Material(color: Colors.transparent, child: _buildLogo());
      },
    );
  }

  Widget _buildLogo() {
    switch (type) {
      case LogoType.svg:
        return SvgPicture.asset(AppIcons.logoIc, width: size, colorFilter: color?.colorFilter);
      case LogoType.png:
        return Image.asset(AppImages.logo, width: size);
      case LogoType.wide:
        return SvgPicture.asset(AppIcons.wideLogo, width: size, colorFilter: color?.colorFilter);
      default:
        return SvgPicture.asset(AppIcons.logoIc, width: size, colorFilter: color?.colorFilter);
    }
  }
}
