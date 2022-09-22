import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class BaseController {
  static void handleError(error) {
    if (error is BadRequestException) {
    } else if (error is FetchDataException) {
    } else if (error is ApiNotRespondingException) {}
  }
}
