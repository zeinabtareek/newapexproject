import 'package:get/get.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/login_services.dart';

class LoginController extends BaseController {
  final _services = LoginServices();
  final _email = ''.obs;
  final _password = ''.obs;

  String get email => _email.value;

  String get password => _password.value;

  validEmail(String email) {
    _email.value = email;
  }

  validPassword(String password) {
    _password.value = password;
  }

  log() async {
    UserModel? user = await _services.login("zozo@gmail.com", "01004479160");
    AuthController.to.changeLoggedIn(true, user!);
  }
}
