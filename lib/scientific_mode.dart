import 'package:flutter/material.dart';


class ScientificMode extends StatelessWidget {
  const ScientificMode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Tooltip(
                    message: "Scientific Mode",
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16)),
                    child: IconButton(
                      icon: const Icon(Icons.calculate_outlined),
                      color: Colors.white,
                      iconSize: 24,
                      splashRadius: 20,
                      splashColor: Colors.grey,
                      onPressed: () {},
                    ));
  }
}