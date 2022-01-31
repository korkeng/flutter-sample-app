import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  late String text;
  late String image;
  late Color? colors;

  MenuCard({
    Key? key,
    required this.text,
    required this.image,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 100,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 10,
            height: 100,
            color: colors ?? Colors.red.shade400,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            image,
            width: 80,
            height: 80,
          )
        ],
      ),
    );
  }
}
