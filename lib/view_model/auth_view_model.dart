import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../respositories/aurth_respository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

var firstname='';
var id  =0;


class AuthViewModel with ChangeNotifier {

  final _myRespository = AuthRespository();
  bool _loading = false;
  bool get loading => _loading;

 void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRespository.loginApi(data).then((value) {
      setLoading(false);
      if (value['status'] == 'true') {
        firstname = value['name'];
        id = value['id'];
        print('customer id === $id');

        Utils.flushBarErrorMessage('Login Successfully', context,Colors.green);
        Navigator.pushNamed(context, RouteNames.home);
      } else {
        Utils.flushBarErrorMessage(value['message'], context,Colors.red);
      }

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
