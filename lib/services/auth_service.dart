import 'package:karmalab_assignment/constants/network_constants.dart';
import 'package:karmalab_assignment/services/base/base_client.dart';

class AuthService {
  final BaseClient _baseClient = BaseClient();
  Future<dynamic> register(dynamic object) async {
    return await _baseClient.post(
      NetworkConstants.registerAPI,
      object,
      header: {'Content-Type': "application/json"},
    );
  }
}
