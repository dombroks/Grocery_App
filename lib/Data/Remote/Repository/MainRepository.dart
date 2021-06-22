import '../FirebaseSource.dart';

class MainRepository {
  static MainRepository _mainRepository;

  static MainRepository getInstance() {
    if (_mainRepository == null) {
      _mainRepository = MainRepository();
      return _mainRepository;
    } else {
      return _mainRepository;
    }
  }

  FirebaseSource _firebaseSource = FirebaseSource.getInstance();

  Future<void> fetchData() async {
    await _firebaseSource.fetchData();
  }

  Future<void> getContriesPrefixCode() async {
    await _firebaseSource.getContriesPrefixCode();
  }

  Future<void> updateRecipientDetails(String uname, String emailAddress,
      String phone, String phonePrefix) async {
    await _firebaseSource.updateRecipientDetails(
        uname, emailAddress, phone, phonePrefix);
  }
}
