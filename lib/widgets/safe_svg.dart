import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utilities/extensions.dart';

class SafeSvg extends StatelessWidget {
  const SafeSvg(
    this.assetName, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.colorFilter,
  });

  final String assetName;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      colorFilter: colorFilter,
      placeholderBuilder: (ctx) => Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        child: Icon(
          Icons.image,
          size: height ?? width ?? 24,
          color: context.colors.textColor.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
