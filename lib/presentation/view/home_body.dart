import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../manger/fetch_Books_cubit2/programing_books_cubit.dart';
import '../widgets/appbar.dart';
import '../widgets/list_view.dart';
import '../widgets/list_view_best_seller.dart';
import '../widgets/card_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = ProgramingBooksCubit.get(context);
      cubit.fetchFutureBooks();
      return CustomScrollView(

        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 66,
                ),
                const Appbar(),
                const SizedBox(
                  height: 30,
                ),
                const CardBar(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Book',
                      style: Styles.titleMedium.copyWith(fontSize: 19),
                    ),
                    Text('See more    ',
                        style: Styles.titleSmoll
                            .copyWith(fontSize: 15, color: Colors.grey)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const BooksListView(
                  link: '',),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text(
                      'Best Seller',
                      style: Styles.titleMedium.copyWith(fontSize: 19),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('The Latest',
                        style: Styles.titleSmoll
                            .copyWith(fontSize: 18, color: Color(0xfff333740))),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('The Latest',
                        style: Styles.titleSmoll
                            .copyWith(fontSize: 18, color: Color(0xfff333740))),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
          const SliverFillRemaining(
            child: ListViewBestSeller(),
          )
        ],
      );
    });
  }
}
