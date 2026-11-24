import 'package:material_ui/material_ui.dart';

enum Directions { toUp, toRight, toBottom, toLeft }
enum NavType { push, pushReplacement }

final class const NavigationRoutes._() {
  static Widget _getTranslation({
    required Animation<double> animation,
    required Widget child,
    required Directions direction,
  }) {
    const end = Offset.zero;
    Animatable<Offset> tween;

    switch (direction) {
      case .toUp: {
        const begin = Offset(0.0, -1.0);
        tween = Tween(begin: begin, end: end);
        break;
      }
      case .toRight: {
        const begin = Offset(1.0, 0.0);
        tween = Tween(begin: begin, end: end);
        break;
      }
      case .toBottom: {
        const begin = Offset(0.0, 1.0);
        tween = Tween(begin: begin, end: end);
        break;
      }
      case .toLeft: {
        const begin = Offset(-1.0, 0.0);
        tween = Tween(begin: begin, end: end);
        break;
      }
    }
    return SlideTransition(position: animation.drive(tween), child: child);
  }

  static Route<dynamic> getRoute({
    required Widget screen,
    required Directions direction,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, _, _) => screen,
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (_, animation, _, child) {
        return _getTranslation(
          animation: animation,
          child: child,
          direction: direction,
        );
      },
    );
  }
}
