import 'package:flutter/material.dart';

import '../../core/styles.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.description,}) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(17.0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Styles.titleMedium.copyWith(fontSize: 19),
            ),
            SizedBox(height:19),
            Text(
                description,
                style: Styles.titleSmoll
                    .copyWith(fontSize: 15, color: Colors.grey),maxLines: 4,overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
