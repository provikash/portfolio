import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/skills/skills_component.dart'
    show SkillChip;
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/projects.dart' show Projects;
import 'package:portfolio/model/project.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/custom_cached_image.dart';
import 'package:portfolio/widgets/sequential_animator.dart';
import 'package:portfolio/widgets/text/gradient_text.dart';
import 'package:portfolio/widgets/text/subtext.dart';

part 'project_item.dart';

class ProjectsComponent extends StatelessWidget {
  const ProjectsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final projects = Projects.all;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * 0.9,
          child: GradientText(
            text: 'Selected *Works*',
            textStyle: Styles.headlineTextBold(
              textColor: colors.textColor,
              isMobile: context.isMobile,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(Sizes.spacingMedium),
        Subtext(
          'A focused collection of Flutter apps, backend integrations, and production-oriented mobile projects.',
        ),
        Gap(Sizes.spacingXXL),
        Container(
          alignment: Alignment.center,
          width: context.width * 0.9,
          child: AnimatedSwitcher(
            duration: 300.milliseconds,
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                children: [
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.start,
              spacing: Sizes.spacingLarge,
              runSpacing: Sizes.spacingLarge,
              children: projects
                  .map((project) => AnimatedProjectItem(project: project))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
