import 'package:material_ui/material_ui.dart';

class const LeftScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(child: Center(child: Text("Left Screen"))),
    );
  }
}
