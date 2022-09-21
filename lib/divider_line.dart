import 'package:flutter/material.dart';


class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Divider(
                height: 1,
                color: Colors.white,
              ),
            );
  }
}