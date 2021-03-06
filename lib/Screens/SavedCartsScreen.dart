
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/Data/Model/ElementFV.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:grocery_app/components/SavedCart.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

class SavedCarts extends StatefulWidget {
  @override
  _SavedCartsState createState() => _SavedCartsState();
}

class _SavedCartsState extends State<SavedCarts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SharedViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Saved cart"),
        ),
        body: FirebaseAnimatedList(
            defaultChild: Center(
              child: CircularProgressIndicator(),
            ),
            query: provider.getSavedCarts(),
            itemBuilder: (BuildContext context, DataSnapshot snap,
                Animation<double> animation, int index) {
              Map map = snap.value;
              double totalPrice = 0;
              List<ElementFV> elements = [];
              map.forEach((key, value) {
                totalPrice +=
                    double.parse(value['price']) * value['amountForBuying'];
                ElementFV e = ElementFV(
                    value['name'],
                    value['price'],
                    value['image'],
                    value['amount'],
                    value['amountForBuying'].toInt());
                elements.add(e);
              });
              return SavedCart(
                savedCartName: snap.key,
                totalPrice: totalPrice.toString(),
                itemsNumber: snap.value.length.toString(),
                elements: elements,
              );
            }));
  }
}
