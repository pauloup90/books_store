import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/custom_error.dart';
import '../../manger/fetch_Books_cubit1/sports cubit/sports.dart';
import '../../manger/fetch_Books_cubit2/programing_books_state.dart';
import '../view/book_detils.dart';
import 'list_view_item_detils.dart';

class ListBooksDetilsView extends StatelessWidget {
  const ListBooksDetilsView({
    Key? key, required this.link,
  }) : super(key: key);
 final String link;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = SportsBooksCubit.get(context);
      cubit.fetchFutureBooks2();

      return BlocBuilder<SportsBooksCubit, ProgramingBooksState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // GoRouter.of(context).push('/BookDetails');
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookDetails(
                              image:
                              '${cubit.bookModels!.items![index].volumeInfo!.imageLinks!.thumbnail}',
                              text: cubit.bookModels!.items![index]
                                  .volumeInfo!.title! [0],
                              rat:
                              '${cubit.bookModels!.items![index].volumeInfo!.averageRating ?? 5.4}',
                              title:
                              '${cubit.bookModels!.items![index].volumeInfo!.authors }',
                              rating:
                              '(${cubit.bookModels!.items![index].volumeInfo!.ratingsCount ?? 0})',
                              description: cubit.bookModels!.items![index]
                                  .volumeInfo!.description!,
                              lang:
                              '${cubit.bookModels!.items![index].volumeInfo!.language }',



                            );
                          },
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListViewItemDetils(
                          imageUrl:
                          "${cubit.bookModels!.items![index].volumeInfo!.imageLinks!.smallThumbnail}",
                        ),
                      ));
                },
              ),
            ),
          );
        },
      );
    });
  }
}
