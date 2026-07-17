import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/about/about_component.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/contact/contact_component.dart';
import 'package:portfolio/components/home/home_component.dart';
import 'package:portfolio/components/projects/projects_component.dart';
import 'package:portfolio/components/skills/skills_component.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/utilities/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppNavigator.scrollToPendingSection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PortfolioSection(
            sectionKey: AppNavigator.sectionKeys[Routes.home],
            child: const HomeComponent(),
          ),
          _PortfolioSection(
            sectionKey: AppNavigator.sectionKeys[Routes.about],
            child: const AboutComponent(),
          ),
          _PortfolioSection(
            sectionKey: AppNavigator.sectionKeys[Routes.projects],
            child: const ProjectsComponent(),
          ),
          _PortfolioSection(
            sectionKey: AppNavigator.sectionKeys[Routes.skills],
            child: const SkillsComponent(),
          ),
          _PortfolioSection(
            sectionKey: AppNavigator.sectionKeys[Routes.contact],
            child: const ContactComponent(),
          ),
        ],
      ),
    );
  }
}

class _PortfolioSection extends StatelessWidget {
  const _PortfolioSection({
    required this.child,
    this.sectionKey,
  });

  final Widget child;
  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: context.isMobile ? 0 : context.height - Sizes.navBarHeight,
      ),
      padding: EdgeInsets.only(
        top: Sizes.spacingXXL,
        bottom: context.isMobile ? Sizes.spacingXXL : Sizes.iconHuge,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          Gap(context.isMobile ? Sizes.spacingXL : Sizes.spacingXXL),
        ],
      ),
    );
  }
}
