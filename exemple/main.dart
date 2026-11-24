import 'package:material_ui/material_ui.dart';
import 'package:swap_navigation/swap_navigation.dart';
import 'screens/export.dart';

void main() {
  runApp(const MyApp());
}

class const MyApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Home());
  }
}

class const Home({super.key}) extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        width: .infinity,
        padding: const .all(10),
        child: const SafeArea(
          child: Center(
            child: NavigationDetector(
              screens: Screen(
                upScreen: UpScreen(),
                rightScreen: RightScreen(),
                bottomScreen: BottomScreen(),
                leftScreen: LeftScreen(),
              ),
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}