import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/custom_error.dart';
import '../../manger/fetch_Books_cubit2/programing_books_cubit.dart';
import '../../manger/fetch_Books_cubit2/programing_books_state.dart';
import '../view/book_detils.dart';
import 'list_view_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    Key? key,
    required this.link,
  }) : super(key: key);
  final String link;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = ProgramingBooksCubit.get(context);

      return BlocBuilder<ProgramingBooksCubit, ProgramingBooksState>(
        builder: (context, state) {
          if (state is ProgramingBooksLoading) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child:
                    Image.asset('assets/icons/lod.gif', height: 30, width: 100),
              ),
            );
          } else if (state is ProgramingBooksError) {
            return CustomError(errMassage: state.errorMsg);
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .34,
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
                            text: cubit
                                .bookModels!.items![index].volumeInfo!.title!,
                            rat:
                                '${cubit.bookModels!.items![index].volumeInfo!.averageRating ?? 4},5',
                            title:
                                '${cubit.bookModels!.items![index].volumeInfo!.authors![0]}',
                            rating:
                                '${cubit.bookModels!.items![index].volumeInfo!.pageCount ?? 200}',
                            description:
                                '${cubit.bookModels!.items![index].volumeInfo!.description ?? 0}',
                            lang:
                                '${cubit.bookModels!.items![index].volumeInfo!.language}',
                          );
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ListViewItem(
                        imageUrl:
                            "${cubit.bookModels!.items![index].volumeInfo!.imageLinks!.smallThumbnail}",
                        deta: "3d 5h",
                        pageCount:
                            "${cubit.bookModels!.items![index].volumeInfo!.pageCount ?? 200}",
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      );
    });
  }
}
