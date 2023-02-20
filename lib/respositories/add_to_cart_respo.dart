
import 'package:happy_toys/model/products_model.dart';
import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../model/add_to_cart_model.dart';
import '../resources/app_urls.dart';

class AddtoCartRespository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> addtoCartApi(dynamic data) async {

    try {

      dynamic response =
      await _apiServices.getPostApiResponse(AppUrls.addtocart, data);

      return response = AddtoCartModel.fromJson(response);

    } catch (e) {
      throw e;
    }
  }
}