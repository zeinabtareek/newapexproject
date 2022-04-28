import 'dart:convert';
import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/favorite_model.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences prefs = await SharedPreferences.getInstance();

class FavoriteController extends BaseController {
  static FavoriteController to = Get.find();
  List<ProductModel> _favoriteModel = [];

  List<ProductModel> get favoriteModel => _favoriteModel;
  final check = false.obs;

  @override
  onInit() async {
    super.onInit();
    getAllProductList();
  }

  isChecked() {
    check.value = !check.value;
  }

  addToFavorite(ProductModel favourite) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (check.value == false) {
      check.value = !check.value;
      _favoriteModel.add(favourite);
      var x = json.encode(favourite);
      var value = await prefs.setString('fav', x);
      print(value);
      update();
      print('this is added to favorite');
    } else if (check.value == true) {
      check.value = !check.value;
      _favoriteModel.remove(favourite);
      var x = json.encode(favourite);
      var value = await prefs.remove('fav');
      update();
      print('this is remove');
    }
    update();
  }

  getAllProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('fav');
    print(value!);
    update();

    return ProductModel.fromJson(json.decode(value));
  }

  removefromFavorite(ProductModel favouriteModel) async {
    _favoriteModel.remove(favouriteModel);
    check.value = !check.value;
    update();
    print('this is removed from favorite');
  }

  Future<ProductModel?> get getFav async {
    try {
      ProductModel favouriteModel = await getAllProductList();
      if (favoriteModel == null) {
        return null;
      } else {
        print(favouriteModel);
        return favouriteModel;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// addToFavorite(String x)async{
// SharedPreferences prefs = await SharedPreferences.getInstance();
// _string.add(x);
// await prefs.setString('fav', x);
// update();

// }
// getAllProductList()async{
//   SharedPreferences prefs= await SharedPreferences.getInstance();
//   var value = prefs.getString('fav');
//   return value;
//   update();
// }
}
