import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants.dart';
import '../../core/styles.dart';
import '../../core/widgets/custom_error.dart';
import '../../manger/fetch_Books_cubit1/sports cubit/sports.dart';
import '../../manger/fetch_Books_cubit2/programing_books_state.dart';
import '../view/book_detils.dart';

class ListViewBestSeller extends StatelessWidget {
  const ListViewBestSeller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = SportsBooksCubit.get(context);

      return BlocBuilder<SportsBooksCubit, ProgramingBooksState>(
        builder: (context, state) {
          {
            {
              if (state is ProgramingBooksLoading) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/icons/lod.gif',
                        height: 30, width: 100),
                  ),
                );
              } else if (state is ProgramingBooksError) {
                return CustomError(errMassage: state.errorMsg);
              } else {
                return ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookDetails(
                                      image:
                                          '${cubit.bookModels!.items![index].volumeInfo!.imageLinks!.thumbnail}',
                                      text: cubit.bookModels!.items![index]
                                          .volumeInfo!.title!,
                                      rat:
                                          '${cubit.bookModels!.items![index].volumeInfo!.averageRating ?? .9}',
                                      title:
                                          '${cubit.bookModels!.items![index].volumeInfo!.authors![0]}',
                                      rating:
                                          '${cubit.bookModels!.items![index].volumeInfo!.pageCount ?? 200}',
                                      description: cubit
                                          .bookModels!
                                          .items![index]
                                          .volumeInfo!
                                          .description!,
                                      lang:
                                          '${cubit.bookModels!.items![index].volumeInfo!.language}',
                                    );
                                  },
                                ));
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  '${cubit.bookModels!.items![index].volumeInfo!.imageLinks!.thumbnail}'))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .5,
                                              child: Text(
                                                  cubit
                                                      .bookModels!
                                                      .items![index]
                                                      .volumeInfo!
                                                      .title!,
                                                  maxLines: 3,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: Styles.titleSmoll
                                                      .copyWith(
                                                          fontFamily:
                                                              GTSectraFine)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          '${cubit.bookModels!.items![index].volumeInfo!.authors![0]}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                  'assets/icons/document.png'),
                                              height: 18,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "${cubit.bookModels!.items![index].volumeInfo!.pageCount} p",
                                                  style: Styles.titleSmoll
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 16)),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Image(
                                              image: AssetImage(
                                                  'assets/icons/cartoon-eyes.png'),
                                              height: 15,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text('12,4b',
                                                style: Styles.titleSmoll
                                                    .copyWith(
                                                        color: Colors.grey,
                                                        fontSize: 16)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));
                    });
              }
            }
          }
        },
      );
    });
  }
}
