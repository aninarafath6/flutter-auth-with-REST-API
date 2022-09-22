import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/base/base_client.dart';

class AuthService extends BaseController {
  final BaseClient _baseClient = BaseClient();
  Future<dynamic> register(dynamic object) async {
    var response = await _baseClient.post(
      NetworkConstants.registerAPI,
      object,
      header: {'Content-Type': "application/json"},
    ).catchError(handleError);
    return response;
  }
}
