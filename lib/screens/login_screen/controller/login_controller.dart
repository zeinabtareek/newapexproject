import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/OrderModel.dart';
import 'package:newapexproject/model/TokenModel.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';
import 'package:newapexproject/services/login_services.dart';

class LoginController extends BaseController {
  final _services = LoginServices();
  final _email = ''.obs;
  final _password = ''.obs;
  final check = false.obs;
  final _currentUser = TokenModel().obs;
  PaginatedOrderModel? orderModel;

  String get email => _email.value;

  String get password => _password.value;

  validEmail(String email) {
    _email.value = email;
  }

  validPassword(String password) {
    _password.value = password;
  }

  log(BuildContext context) async {
    check.value = true;
    UserModel? user = await _services.login(email, password, context);
    AuthController.to.changeLoggedIn(true, user);
    check.value = !check.value;
  }

  login() {
    _services.loginApi(email, password);
    // print(AuthServices().getToken());
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    // _currentUser.value =await AuthServices().getToken();
    // print(_currentUser.value.token);
   orderModel=await _services.getOrder();
   print(orderModel!.orders![1].id);
  }
}
