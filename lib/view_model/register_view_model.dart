import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_toys/respositories/new_user_respository.dart';
import 'package:provider/provider.dart';

import '../respositories/aurth_respository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';


class RegisterViewModel with ChangeNotifier {

  final _myRespository = NewUserRespository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {

    setLoading(true);

    _myRespository.signUpApi(data).then((value) {

      setLoading(false);
      if (value['status'] == 'true') {

        Utils.flushBarErrorMessage('Login Successfully', context,Colors.green);
        Navigator.pushNamed(context, RouteNames.login);
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
