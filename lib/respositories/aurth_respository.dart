

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../resources/app_urls.dart';

class AuthRespository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrls.loginAuth, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
