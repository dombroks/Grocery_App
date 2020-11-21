import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Model/CreditCart.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/components/AddCard.dart';
import 'package:grocery_app/components/CreditCard.dart';

import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class AddPaymentMethod extends StatefulWidget {
  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Mediator>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Add a payment method"),
        centerTitle: true,
      ),
      body: FirebaseAnimatedList(
          defaultChild: AddCard(),
          query: provider.getCreditCards(),
          itemBuilder: (BuildContext context, DataSnapshot snap,
              Animation<double> animation, int index) {
            Map map = snap.value;
            List<CreditCardModel> cards = [];

            print(map.entries.elementAt(0).value);
            /*
            map.forEach((key, value) {
              CreditCardModel card = CreditCardModel(value["holderName"],
                  value["number"], value["cvv"], value["month"], value["year"]);
              cards.add(card);
            });
            */
            return CreditCard(
                name: "name",
                number: "8254561615618915",
                cvv: "285",
                month: "05",
                year: "1995");
          }),
    );
  }
}
