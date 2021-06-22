import 'package:grocery_app/Data/Model/ElementFV.dart';
import 'package:grocery_app/Data/Remote/FirebaseSource.dart';

class CartRepository {
  static CartRepository _cartRepository;

  static CartRepository getInstance() {
    if (_cartRepository == null) {
      _cartRepository = CartRepository();
      return _cartRepository;
    } else {
      return _cartRepository;
    }
  }

  FirebaseSource _firebaseSource = FirebaseSource.getInstance();

  //List<ElementFV> cartElements = FirebaseSource.getInstance().cartElements;

  // User Data
  bool userDataIsLoaded = FirebaseSource.getInstance().userDataIsLoaded;
  String profileImageUrl = FirebaseSource.getInstance().profileImageUrl;
  String username = FirebaseSource.getInstance().username;
  String email = FirebaseSource.getInstance().email;
  String phoneNumber = FirebaseSource.getInstance().phoneNumber;
  String numberPrefix = FirebaseSource.getInstance().numberPrefix;
  String userId = FirebaseSource.getInstance().userId;

  // Error massages
  String signInErrorMessage = FirebaseSource.getInstance().signInErrorMessage;
  String signOutErrorMessage = FirebaseSource.getInstance().signOutErrorMessage;

  var savedCarts;
  List<String> prefixCodes = FirebaseSource.getInstance().prefixCodes;
  List<ElementFV> vegetables = FirebaseSource.getInstance().vegetables;
  List<ElementFV> fruits = FirebaseSource.getInstance().fruits;
  List<ElementFV> cartElements = FirebaseSource.getInstance().cartElements;
  double totalPrice = FirebaseSource.getInstance().totalPrice;

  bool totalPriceIsLoaded = FirebaseSource.getInstance().totalPriceIsLoaded;

  Future<void> decreaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    await _firebaseSource.decreaseAmountForBuyingForSavedCart(cartName, e);
  }

  Future<void> increaseAmountForBuyingForSavedCart(
      String cartName, ElementFV e) async {
    await _firebaseSource.increaseAmountForBuyingForSavedCart(cartName, e);
  }

  Future deleteSavedCart(String cartName) async {
    await _firebaseSource.deleteSavedCart(cartName);
  }

  getSavedCarts() {
    _firebaseSource.getSavedCarts();
  }

  Future<void> saveCart(String cartName) async {
    await _firebaseSource.saveCart(cartName);
  }

  Future<void> romeveElementFromCart(ElementFV element) async {
    await _firebaseSource.romeveElementFromCart(element);
  }

  Future<void> deleteElementFromCart(ElementFV element) async {
    await _firebaseSource.deleteElementFromCart(element);
  }

  Future addElementToCart(ElementFV element) async {
    await _firebaseSource.addElementToCart(element);
  }

  fetchCartElements() async {
    await _firebaseSource.fetchCartElements();
  }

  getCartElementsTotalPrice() {
    _firebaseSource.getCartElementsTotalPrice();
  }

  Future<void> decreaseAmount(ElementFV cart) async {
    await _firebaseSource.decreaseAmount(cart);
  }

  Future<void> increaseAmount(ElementFV cart) async {
    await _firebaseSource.increaseAmount(cart);
  }
}
