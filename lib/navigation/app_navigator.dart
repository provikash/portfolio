part of 'navigation.dart';

class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final Map<Routes, GlobalKey> sectionKeys = {
    Routes.home: GlobalKey(),
    Routes.about: GlobalKey(),
    Routes.projects: GlobalKey(),
    Routes.skills: GlobalKey(),
    Routes.contact: GlobalKey(),
  };

  static Routes? _pendingSection;

  static NavigatorState? get _navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;

  static Routes? get currentRoute {
    String? currentPath;
    _navigator?.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });
    return currentPath != null ? Routes.fromPath(currentPath!) : null;
  }

  static void push(Routes route) {
    if (sectionKeys.containsKey(route)) {
      scrollToSection(route);
      return;
    }

    _navigator?.pushNamed(route.route);
  }

  static void pushReplacement(Routes route) =>
      _navigator?.pushReplacementNamed(route.route);

  static void pushAndClearAll(Routes route) =>
      _navigator?.pushNamedAndRemoveUntil(route.route, (_) => false);

  static void pop() {
    if (canPop) _navigator?.pop();
  }

  static void popUntil(Routes route) =>
      _navigator?.popUntil((r) => r.settings.name == route.route);

  static void popToFirst() => _navigator?.popUntil((route) => route.isFirst);

  static bool get canPop => _navigator?.canPop() ?? false;

  static void goHome() => pushAndClearAll(Routes.home);

  static void scrollToSection(Routes route) {
    if (!sectionKeys.containsKey(route)) {
      _navigator?.pushNamed(route.route);
      return;
    }

    _pendingSection = route;

    if (currentRoute == Routes.home) {
      scrollToPendingSection();
      return;
    }

    _navigator?.pushNamedAndRemoveUntil(Routes.home.route, (_) => false);
  }

  static void scrollToPendingSection() {
    final route = _pendingSection;
    if (route == null) return;

    final targetContext = sectionKeys[route]?.currentContext;
    if (targetContext == null) return;

    _pendingSection = null;
    Scrollable.ensureVisible(
      targetContext,
      duration: 700.milliseconds,
      curve: Curves.easeInOutCubic,
      alignment: route == Routes.home ? 0 : 0.04,
    );
  }
}
