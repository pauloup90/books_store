import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/styles.dart';
import '../../core/widgets/custom_error.dart';
import '../../manger/fetch_Books_cubit1/sports cubit/sports.dart';
import '../../manger/fetch_Books_cubit2/programing_books_state.dart';
import 'book_detils_app_bar.dart';

class DetilsItem extends StatelessWidget {
  const DetilsItem({
    Key? key,
    required this.image,
    required this.rat,
    required this.title,
    required this.rating,
    required this.lang,
    required this.authors,
  }) : super(key: key);
  final String image;
  final String rat;
  final String title;
  final String rating;
  final String lang;
  final String authors;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = SportsBooksCubit.get(context);
      cubit.fetchFutureBooks2();
      return BlocBuilder<SportsBooksCubit, ProgramingBooksState>(
        builder: (cont, state) {
          {
            if (state is ProgramingBooksLoading) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Image.asset(
                      'assets/icons/lod.gif',
                      height: 30,
                      width: 200),
                ),
              );
            } else if (state is ProgramingBooksError) {
              return CustomError(errMassage: state.errorMsg);
            } else {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        width: double.infinity,
                        height: 600,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.fill, image: NetworkImage(image))),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 600,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(29, 33, 43, 0.6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Container(
                        width: 166,
                        height: 243,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.fill, image: NetworkImage(image))),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    left: 1,
                    right: 1,
                    child: AppBarBookDetils(),
                  ),
                  Positioned(
                    top: 410,
                    left: 10,
                    right: 10,
                    child: Text(
                      authors,
                      style: Styles.titleMedium,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 450,
                    bottom: 30,
                    child: Text(
                      title,
                      style: Styles.titleSmoll.copyWith(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    right: 15,
                    top: 500,
                    bottom: 30,
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color.fromRGBO(29, 33, 43, 0.6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                rat,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rating',
                                textAlign: TextAlign.center,
                                style: Styles.titleSmoll.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 40,
                            width: 0.5,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(rating),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Number of \n Page',
                                textAlign: TextAlign.center,
                                style: Styles.titleSmoll.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 40,
                            width: 0.5,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(lang),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Language',
                                textAlign: TextAlign.center,
                                style: Styles.titleSmoll.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }  }
      );
    });
  }
}
