import 'package:flutter/material.dart';

import '../../manger/fetch_Books_cubit2/ditels_cubit.dart';
import '../widgets/description.dart';
import '../widgets/item_book_detils.dart';

import '../widgets/result_wid.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.image,
    required this.text,
    required this.rat,
    required this.title,
    required this.rating,
    required this.description,
    required this.lang,
  }) : super(key: key);
  final String image;

  final String text;
  final String description;
  final String rat;
  final String title;
  final String rating;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = DitelsCubit.get(context);
      cubit.bookDetailsCubit();

      return Scaffold(
          body: Column(
          children: [
            const SizedBox(
              height: 20,
           ),
              DetilsItem(
            image: image,
            rat: rat,
            title: title,
            rating: rating,
            lang: lang,
            authors: text,
               ),
            Description(description: description),
           ResultWid()
        ],
      ));
    });
  }
}
