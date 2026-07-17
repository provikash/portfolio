part of 'navigation.dart';

Route<dynamic>? routeGenerator(RouteSettings settings) {
  final route = Routes.fromPath(settings.name ?? '/');

  Widget? page;

  switch (route) {
    case Routes.home:
      page = const HomePage();
      break;
    case Routes.about:
      AppNavigator._pendingSection = Routes.about;
      page = const HomePage();
      break;
    // case Routes.experience:
    //   page = const ExperiencePage();
    //   break;
    case Routes.projects:
      AppNavigator._pendingSection = Routes.projects;
      page = const HomePage();
      break;
    case Routes.skills:
      AppNavigator._pendingSection = Routes.skills;
      page = const HomePage();
      break;
    case Routes.contact:
      AppNavigator._pendingSection = Routes.contact;
      page = const HomePage();
      break;
    // case Routes.contributions:
    //   page = const ContributionsPage();
    //   break;
    case Routes.resume:
      Utils.safelyLaunchUrl(Links.resume.url, AppNavigator.context);
      break;
    // case Routes.blog:
    //   Utils.safelyLaunchUrl(Links.medium.url, AppNavigator.context);
    //   break;
    // case Routes.talks:
    //   Utils.safelyLaunchUrl(Links.talks.url, AppNavigator.context);
    //   break;
    default:
      page = NotFoundPage();
  }

  if (page == null) return null;

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page!,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation.drive(
        Tween<double>(begin: 0, end: 1).chain(
          CurveTween(
            curve: Curves.easeInOut,
          ),
        ),
      ),
      child: child,
    ),
    transitionDuration: 600.milliseconds,
    reverseTransitionDuration: 600.milliseconds,
  );
}
