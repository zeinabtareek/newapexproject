import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:newapexproject/services/products_services.dart';

class ProductScreenController extends BaseController {
  final _services = CategoryServices();
  final docs = <ProductModel>[].obs;

  final favourite = <String, bool>{}.obs;
  final selectedIndex = 0.obs;
  final check = false.obs;

  changeFavourite(String id, String key, String value, bool check) {
    favourite[value] = !favourite[value]!;
    _services.setCategoryFavourite(id, key, value, favourite[value]!);
  }

  selected(int index) {
    selectedIndex.value = index;
  }

  checkFun() {
    check.value = !check.value;
  }

  getDocs(String id, String key) async {
    docs.assignAll(await _services.getCategoryDocs(id, key));
    docs.forEach((element) {
      favourite.addAll({element.key!: element.inStock!});
    });
    print(favourite.toString());
  }

  getallDocs(String id) async {
    docs.assignAll(await _services.seeAll(id));
  }
}
