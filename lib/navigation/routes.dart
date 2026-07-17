part of 'navigation.dart';

enum Routes {
  home(
    'Home',
    '/',
    icon: FontAwesomeIcons.solidHouse,
  ),
  about(
    'About',
    '/about',
    icon: FontAwesomeIcons.solidUser,
  ),
  experience(
    'Experience',
    '/experiences',
    icon: FontAwesomeIcons.briefcase,
  ),
  projects(
    'Projects',
    '/projects',
    icon: FontAwesomeIcons.diagramProject,
  ),
  skills(
    'Skills',
    '/skills',
    icon: FontAwesomeIcons.laptopCode,
  ),
  contact(
    'Contact',
    '/contact',
    icon: FontAwesomeIcons.solidEnvelope,
  ),
  resume(
    'Resume',
    '/resume',
    icon: FontAwesomeIcons.arrowUpRightFromSquare,
  ),
  // contributions(
  //   'Contributions',
  //   '/contributions',
  //   icon: FontAwesomeIcons.codeBranch,
  // ),
  
  blog(
    'Tech Blog',
    '/blogs',
    icon: FontAwesomeIcons.medium,
  );

  final String name;
  final String route;
  final FaIconData? icon;

  const Routes(this.name, this.route, {this.icon});

  static Routes? fromPath(String path) {
    for (final route in Routes.values) {
      if (route.route == path) return route;
    }
    return null;
  }

  static Routes? fromName(String name) {
    for (final route in Routes.values) {
      if (route.name.toLowerCase() == name.toLowerCase()) return route;
    }
    return null;
  }

  static List<Routes> get mainRoutes => [
        Routes.home,
        Routes.about,
        Routes.projects,
        Routes.skills,
        Routes.contact,
      ];

  
}
