import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculationHistory extends StatelessWidget {
  const CalculationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
                    message: "History",
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16)),
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.clock),
                      color: Colors.white,
                      iconSize: 24,
                      splashRadius: 20,
                      splashColor: Colors.grey,
                      onPressed: () {},
                    ));
  }
}