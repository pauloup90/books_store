import 'package:flutter/material.dart';
class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.imageUrl, required this.deta, required this.pageCount}) : super(key: key);
  final String imageUrl;
  final String deta;
  final String pageCount;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 150,
          height: 225,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    imageUrl,
                  ))),
        ),


      ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(image:AssetImage('assets/icons/clock.png'),height: 15,color: Colors.grey, ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text (deta),
                ),

                Image(image:AssetImage('assets/icons/document.png'),height: 18,color: Colors.white, ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text (pageCount),
                )

              ],
            ),
          )
    ]);
  }
}
