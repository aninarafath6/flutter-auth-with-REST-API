import 'package:get/get.dart';
import 'package:karmalab_assignment/services/shared_pref_service.dart';
import 'package:karmalab_assignment/views/authentication/select_auth/select_auth_view.dart';

class LoginController {
  final SharedPrefService _sharedPrefService = SharedPrefService();

  // ignore: todo
  // TODO: Logout functionality
  void logout() {
    _sharedPrefService.clear();
    Get.toNamed(SelectAuthView.routeName);
  }
}
