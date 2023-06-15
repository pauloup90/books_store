import 'package:flutter/material.dart';

import '../styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.errMassage}) : super(key: key);
  final String errMassage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMassage,
        style: Styles.titleMedium,
      ),
    );
  }
}
