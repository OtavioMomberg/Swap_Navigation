import 'package:material_ui/material_ui.dart';
import 'package:swap_navigation/src/core/export.dart';

export 'package:swap_navigation/src/models/screen.dart';

/// A widget that detects horizontal and vertical swipe gestures
/// to navigate between screens.
///
/// The destination screens are configured through [screens].
/// Navigation can be customized using [type], [customDefaultScreen]
/// and [customChild].
///
/// By default, [NavigationUI] is displayed as the child widget.
/// You can customize its appearance or replace it entirely using
/// [customChild].
class const NavigationDetector({
  required final Screen screens,
  final bool justHorizontal = false,
  final bool justVertical = false,

  /// Defines how navigation should be performed.
  /// - [NavType.push]: pushes the destination screen onto the navigation stack.
  /// - [NavType.pushReplacement]: replaces the current screen.
  final NavType type = .push,

  /// Defines a custom fallback screen when a destination is not provided
  /// in [screens].
  /// If this parameter is `null`, [DefaultScreen] is displayed instead.
  final Widget? customDefaultScreen,

  /// Replaces the default [NavigationUI] with a custom widget.
  /// When provided, the appearance-related parameters of [NavigationUI]
  /// are ignored.
  final Widget? customChild,

  final double? height,
  final double? width,
  final EdgeInsets? padding,
  final BorderRadius? borderRadius,
  final BoxBorder? border,
  final Color? borderColor,
  final Color? backgroundColor,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (justVertical && !justHorizontal) { return; }

        final velocity = details.primaryVelocity;

        if (velocity == null) { return; }

        if (velocity > 0) {
          _navigate(
            context: context,
            type: type,
            screen: screens.leftScreen,
            customDefaultScreen: customDefaultScreen,
            direction: .toLeft,
          );
          return;
        }
        _navigate(
          context: context,
          type: type,
          screen: screens.rightScreen,
          customDefaultScreen: customDefaultScreen,
          direction: .toRight,
        );
      },
      onVerticalDragEnd: (details) {
        if (justHorizontal && !justVertical) { return; }

        final velocity = details.primaryVelocity;

        if (velocity == null) { return; }

        if (velocity > 0) {
          _navigate(
            context: context,
            type: type,
            screen: screens.upScreen,
            customDefaultScreen: customDefaultScreen,
            direction: .toUp,
          );
          return;
        }
        _navigate(
          context: context,
          type: type,
          screen: screens.bottomScreen,
          customDefaultScreen: customDefaultScreen,
          direction: .toBottom,
        );
      },
      child: customChild ?? NavigationUI(
        height: height,
        width: width,
        padding: padding,
        borderRadius: borderRadius,
        border: border,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

/// Handles navigation to the selected destination screen.
/// Uses [NavigationRoutes] to create the route with the specified
/// transition direction.
void _navigate({
  required BuildContext context,
  required Directions direction,
  required NavType type,
  required Widget? screen,
  required Widget? customDefaultScreen,
}) {
  final route = NavigationRoutes.getRoute(
    screen: screen ?? customDefaultScreen ?? const DefaultScreen(),
    direction: direction,
  );

  if (type == .push) {
    Navigator.push(context, route);
    return;
  }
  Navigator.pushReplacement(context, route);
}