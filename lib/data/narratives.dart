import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/model/narrative.dart';

class Narratives {
  Narratives._();

  static final List<Narrative> all = [
    frontend,
    backend,
    architecture,
    growth,
  ];

  static final frontend = Narrative(
    icon: FontAwesomeIcons.mobileScreen,
    baseIcon: FontAwesomeIcons.mobileButton,
    color: KnownColors.cyan500,
    headline: 'Flutter Development',
    description:
        'I build responsive, high-performance cross-platform applications using '
        '**Flutter** and **Dart**. My focus is on creating intuitive user interfaces, '
        'smooth animations, and maintainable code that delivers a consistent experience '
        'across Android, iOS, and Web.',
  );

  static final backend = Narrative(
    icon: FontAwesomeIcons.server,
    baseIcon: FontAwesomeIcons.database,
    color: KnownColors.purple500,
    headline: 'Backend Development',
    description:
        'I develop secure and scalable backend services with **Django REST Framework**, '
        'design RESTful APIs, implement JWT authentication, integrate **Firebase**, '
        'and manage databases such as **PostgreSQL** and **SQLite** to power modern applications.',
  );

  static final architecture = Narrative(
    icon: FontAwesomeIcons.layerGroup,
    baseIcon: FontAwesomeIcons.codeBranch,
    color: KnownColors.green500,
    headline: 'Clean Architecture',
    description:
        'I write clean, modular, and scalable code using **MVVM**, **Riverpod**, and **BLoC**. '
        'I emphasize reusable components, proper state management, API integration, '
        'Git version control, Docker-based development, and software that is easy to maintain.',
  );

  static final growth = Narrative(
    icon: FontAwesomeIcons.lightbulb,
    baseIcon: FontAwesomeIcons.robot,
    color: KnownColors.amber500,
    headline: 'Continuous Learning',
    description:
        'I enjoy solving real-world problems through technology. From developing '
        '**AI-powered applications** like PrepMateAI to exploring modern Flutter '
        'ecosystems and backend technologies, I continuously improve my skills '
        'and build solutions that create meaningful impact.',
  );
}