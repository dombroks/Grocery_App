import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final String paymentCardHolder;
  final String cardSerialNumber;
  final String paymentCardLogo;
  const PaymentMethodItem({
    Key key, this.paymentCardHolder, this.cardSerialNumber, this.paymentCardLogo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 60,
              height: 60,
              child: Center(child: SvgPicture.asset(paymentCardLogo)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paymentCardHolder,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[750]),
                ),
                Text(
                  "....  ....  ....  4528",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
