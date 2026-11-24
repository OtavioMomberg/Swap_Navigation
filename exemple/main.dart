import 'package:material_ui/material_ui.dart';
import 'package:swap_navigation/swap_navigation.dart';
import 'export.dart';

class const Main({super.key}) extends StatelessWidget {
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