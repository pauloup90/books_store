import 'package:flutter/material.dart';

import '../../core/styles.dart';

class CardBar extends StatelessWidget {
  const CardBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff292d36),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/icons/qr-code.png',
                height: 18,
                color: const Color(0xfffa784a),
              ),
              Text(
                'Claim',
                style: Styles.titleSmoll.copyWith(
                  fontSize: 15,
                ),
              ),
              Container(
                color: Colors.grey,
                height: 23,
                width: .7,
              ),
              Image.asset(
                'assets/icons/target.png',
                height: 20,
                color: const Color(0xfffa784a),
              ),
              Text(
                'Get Point',
                style: Styles.titleSmoll.copyWith(
                  fontSize: 15,
                ),
              ),
              Container(
                color: Colors.grey,
                height: 23,
                width: .7,
              ),
              Image.asset(
                'assets/icons/credit-card.png',
                height: 20,
                color: const Color(0xfffa784a),
              ),
              Text(
                'My Card',
                style: Styles.titleSmoll.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
