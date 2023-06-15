import 'package:flutter/material.dart';
class ListViewItemDetils extends StatelessWidget {
  const ListViewItemDetils({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imageUrl,
                  ))),
        ));
  }
}
