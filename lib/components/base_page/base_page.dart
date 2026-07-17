import 'dart:async';

import 'package:day_night_themed_switcher/day_night_themed_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/links.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/grid_background.dart';
import 'package:portfolio/widgets/text/hover_glow_text.dart';

part 'global_footer.dart';
part 'navbar.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    required this.content,
    this.additionalBackground,
    this.singlePageContent = false,
  });

  final Widget content;
  final bool singlePageContent;
  final Widget? additionalBackground;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  bool _showNavbar = false;
  Timer? _hideNavbarTimer;

  void _handleScrollActivity() {
    _hideNavbarTimer?.cancel();

    if (_showNavbar) {
      _startHideTimer();
      return;
    }

    setState(() => _showNavbar = true);
    _startHideTimer();
  }

  void _startHideTimer() {
    _hideNavbarTimer?.cancel();

    _hideNavbarTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => _showNavbar = false);
    });
  }

  @override
  void dispose() {
    _hideNavbarTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: GridBackground(
                color: colors.textColor.withValues(alpha: 0.2),
                strokeWidth: 0.5,
                horizontalSpacing: 45,
                verticalSpacing: 45,
                runnerColor: colors.primaryColor,
              ),
            ),
            if (widget.additionalBackground != null)
              widget.additionalBackground!,
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification ||
                    notification is ScrollUpdateNotification ||
                    notification is UserScrollNotification ||
                    notification is ScrollEndNotification) {
                  _handleScrollActivity();
                }
                return false;
              },
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      alignment: widget.singlePageContent
                          ? Alignment.center
                          : Alignment.topCenter,
                      padding: EdgeInsets.only(
                        top: Sizes.navBarHeight,
                      ),
                      constraints: BoxConstraints(
                        minHeight: context.height,
                      ),
                      child: widget.content,
                    ),
                  ),
                  SliverGap(Sizes.spacingXXL),
                  SliverStretchingFooter(
                    stretchColor: colors.surfaceColor,
                    child: GlobalFooter(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                ignoring: !_showNavbar,
                child: AnimatedSlide(
                  duration: 220.milliseconds,
                  curve: Curves.easeOut,
                  offset: _showNavbar ? Offset.zero : const Offset(0, -1),
                  child: AnimatedOpacity(
                    duration: 180.milliseconds,
                    opacity: _showNavbar ? 1 : 0,
                    child: const Navbar(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
