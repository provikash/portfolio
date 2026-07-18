import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/safe_svg.dart';

/// Attempts to display a PNG fallback first (e.g. assets/logo/flutter.png).
/// If the PNG fails to load, falls back to the SVG via [SafeSvg].
class LogoAsset extends StatelessWidget {
  const LogoAsset(
    this.svgPath, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.colorFilter,
  });

  final String svgPath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final ColorFilter? colorFilter;

  String _pngPath(String svg) {
    if (svg.toLowerCase().endsWith('.svg')) {
      return svg.substring(0, svg.length - 4) + '.png';
    }
    return svg + '.png';
  }

  @override
  Widget build(BuildContext context) {
    final png = _pngPath(svgPath);

    // Try PNG first on web (faster/easier). If it fails, show SVG.
    return Image.asset(
      png,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      errorBuilder: (_, __, ___) {
        return SafeSvg(
          svgPath,
          height: height,
          width: width,
          fit: fit,
          colorFilter: colorFilter,
        );
      },
    );
  }
}
