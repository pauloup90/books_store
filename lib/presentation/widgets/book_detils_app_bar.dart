import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/core/styles.dart';

class AppBarBookDetils extends StatelessWidget {
  const AppBarBookDetils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
              )),
          Text('Detail Book',style: Styles.titleSmoll.copyWith(fontSize: 18),),
          
          IconButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                padding: EdgeInsets.all(0)
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 24,
              )),
        ],
      ),
    );
  }
}
