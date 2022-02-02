import 'package:flutter/material.dart';

class CustomButtomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CustomButtomSheet({
    Key? key,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 80,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
