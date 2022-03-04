import 'dart:convert';
import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


// SharedPreferences prefs = await SharedPreferences.getInstance();

class FavoriteController extends BaseController {

  List<FavouriteModel> _favoriteModel=[];
  List<FavouriteModel> get favoriteModel=>_favoriteModel;
  final check = false.obs;
  @override
   onInit() async {
    super.onInit();
    getAllProductList();
  }

isChecked(){
  check.value = !check.value;

}
  addToFavorite(FavouriteModel favourite)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favoriteModel.add(favourite);
    var x =json.encode(favourite);
   await prefs.setString('fav', x);
   update();
    print('this is added to favorite');
  }
  getAllProductList()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var value = prefs.getString('fav');
    return FavouriteModel.fromJson(json.decode(value!));
  }
  removefromFavorite(FavouriteModel favouriteModel)async {
  _favoriteModel.remove(favouriteModel);
  update();
    print('this is removed from favorite');
  }

  Future<FavouriteModel?> get getFav async{
    try{
      FavouriteModel favouriteModel =await getAllProductList();
      if(favoriteModel==null){
        return null;
      }else{
        return favouriteModel;
      }
    }catch(e){
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
