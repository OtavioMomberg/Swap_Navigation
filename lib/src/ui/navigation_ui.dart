import 'package:material_ui/material_ui.dart';

class const NavigationUI({
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
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const .all(5),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? const .all(.circular(12)),
        border: border ?? .all(color: borderColor ?? Colors.black),
        color: backgroundColor,
      ),
      child: const Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            mainAxisAlignment: .center, 
            children: [
              Icon(Icons.arrow_upward)
            ]
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Icon(Icons.arrow_back), 
              Icon(Icons.arrow_forward),
            ],
          ),
          Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.arrow_downward),
            ],
          ),
        ],
      ),
    );
  }
}