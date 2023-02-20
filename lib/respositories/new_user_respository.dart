

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../resources/app_urls.dart';

class NewUserRespository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrls.register, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
