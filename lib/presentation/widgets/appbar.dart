import 'package:flutter/material.dart';

import '../../core/styles.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(text:
          TextSpan(children: [
            TextSpan(text: 'Good Morning\n',style: Styles.titleSmoll.copyWith(
              fontSize: 17
            )),
            TextSpan(text: '\nBatricia Salfiora'
                ,style: Styles.titleMedium.copyWith(fontSize: 20)),

          ])),
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: Container(
               height: 35,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xfffa784a)
              ),
              child: Row(

                children: [
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xfffa784a),
                    radius: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:  Image.network(
                          'https://media.licdn.com/dms/image/D4D03AQESonjWw1i8vQ/profile-displayphoto-shrink_200_200/0/1684971299931?e=1692230400&v=beta&t=0qc0Ldf_aDj-iQrW1xNiEmwmnqnDc0sKHK9ngBU7N60',

                      ),
                    )
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('240€',style: Styles.titleSmoll.copyWith(fontSize: 17,fontWeight: FontWeight.w400)),

                ],
              ),
            ),
          ),

        ],

    );
  }
}
