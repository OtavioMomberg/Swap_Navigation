# Swap Navigation

A Flutter package that enables screen navigation through horizontal and vertical swipe gestures.
With Swap Navigation, you can navigate between screens by swiping in four directions: up, down, left, and right.

## Features

- Navigate between screens using swipe gestures.
- Support for four navigation directions.
- Enable horizontal or vertical gestures independently.
- Choose between `push` and `pushReplacement` navigation.
- Customize the default fallback screen.
- Replace the default navigation UI with your own widget.
- Customize the appearance of the default navigation UI.
- Animated screen transitions.

## Installation

Add `swap_navigation` to your `pubspec.yaml`:

```yaml
dependencies:
  swap_navigation:
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:swap_navigation/swap_detector.dart';
```

### Basic Example

Wrap your widget with `NavigationDetector` and define the destination screens using `Screen`.

```dart
NavigationDetector(
  screens: Screen(
    upScreen: const UpScreen(),
    rightScreen: const RightScreen(),
    bottomScreen: const BottomScreen(),
    leftScreen: const LeftScreen(),
  ),
)
```

Now, swipe in any direction to navigate to the corresponding screen.

### Navigation Directions

| Swipe Direction | Destination |
|-----------------|-------------|
| Up              | `upScreen` |
| Right           | `rightScreen` |
| Down            | `bottomScreen` |
| Left            | `leftScreen` |

### Gesture Configuration

You can restrict navigation to horizontal or vertical gestures.

**Horizontal gestures only:**

```dart
NavigationDetector(
  screens: screens,
  justHorizontal: true,
)
```

**Vertical gestures only:**

```dart
NavigationDetector(
  screens: screens,
  justVertical: true,
)
```

By default, both horizontal and vertical gestures are enabled.

### Navigation Type

Choose how the destination screen is added to the navigation stack.

```dart
NavigationDetector(
  screens: screens,
  type: NavType.push,
)
```

Available options:

- `NavType.push`: Pushes the destination screen onto the navigation stack.
- `NavType.pushReplacement`: Replaces the current screen.

The default value is `NavType.push`.

### Custom Default Screen

You can provide a custom fallback screen that will be displayed whenever a destination screen is not defined.

```dart
NavigationDetector(
  screens: Screen(
    leftScreen: const LeftScreen(),
  ),
  customDefaultScreen: const MyDefaultScreen(),
)
```

If neither a destination screen nor a custom fallback screen is provided, the package's default screen is used.

### Custom Child

You can replace the default navigation UI with any widget of your choice.

```dart
NavigationDetector(
  screens: screens,
  customChild: const MyCustomWidget(),
)
```

When `customChild` is provided, the default UI customization parameters are ignored.

### Default UI Customization

If you prefer using the built-in `NavigationUI`, you can customize its appearance:

```dart
NavigationDetector(
  screens: screens,
  height: 120,
  width: 120,
  padding: const EdgeInsets.all(12),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(color: Colors.blue),
  borderColor: Colors.blue,
  backgroundColor: Colors.white,
)
```

## Requirements

- Flutter
- Dart

## Supported Platforms

- Android
- iOS

## License

This project is licensed under the MIT License.