import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/fetch_Books_cubit1/sports cubit/sports.dart';
import '../../manger/fetch_Books_cubit2/programing_books_state.dart';
import 'package:like_button/like_button.dart';
import 'lienk_wid.dart';

class ResultWid extends StatelessWidget {
  const ResultWid({
    Key? key,
    required,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = SportsBooksCubit.get(context);
      cubit.fetchFutureBooks2();
      return BlocBuilder<SportsBooksCubit, ProgramingBooksState>(
          builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, left: 20),
              height: 55,
              width: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xff292d36),
              ),
              child:  LikeButton(
            circleColor:CircleColor(start: Color(0xfffa784a), end:  Color(0xfffa784a)),
                size: 20,
              ),
            ),
            GestureDetector(
              onTap: () async {
                launchURLbac(
                  context,
                  'https://openlibrary.org/explore',
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                width: 299,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xfffa784a)),
                child: Center(
                    child: Text(
                  'Open Library ',
                  textAlign: TextAlign.center,
                  style: Styles.titleSmoll.copyWith(fontSize: 15),
                )),
              ),
            ),
          ],
        );
      });
    });
  }
}
