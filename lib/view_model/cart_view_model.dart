import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_toys/respositories/add_to_cart_respo.dart';
import '../utils/utils.dart';


class CartViewModel with ChangeNotifier {

  final _myRespository = AddtoCartRespository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> addtoCart(dynamic data, BuildContext context) async {

    setLoading(true);

    _myRespository.addtoCartApi(data).then((value) {

      setLoading(false);
      // if (value['status'] == 'true') {
      //
      //   // Utils.flushBarErrorMessage('Login Successfully', context,Colors.green);
      //   // Navigator.pushNamed(context, RouteNames.login);
      // } else {
      //   // Utils.flushBarErrorMessage(value['message'], context,Colors.red);
      // }

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {

      setLoading(false);

      if (kDebugMode) {

        Utils.flushBarErrorMessage(error.toString(), context,Colors.red);
        print(error.toString());
      }
    });
  }
}
