import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnitConverter extends StatelessWidget {
  const UnitConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
                    message: "Unit Converter",
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16)),
                    child: IconButton(
                      //alignment: Alignment.center,'
                      //padding: EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      icon: const Icon(FontAwesomeIcons.rulerHorizontal),
                      color: Colors.white,
                      iconSize: 24,
                      splashRadius: 24,
                      splashColor: Colors.grey,
                      onPressed: () {},
                    ));
  }
}