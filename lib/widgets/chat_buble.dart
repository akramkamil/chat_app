import 'package:flutter/material.dart';

import '../constants.dart';

class chatBuble extends StatelessWidget {
  const chatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'hello how are u',
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
      ),
    );
  }
}
