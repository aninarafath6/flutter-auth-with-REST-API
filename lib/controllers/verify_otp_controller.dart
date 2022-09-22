import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:karmalab_assignment/controllers/base_controller.dart';
import 'package:karmalab_assignment/services/base/app_exceptions.dart';

class VerifyOtpController extends GetxController with BaseController {
  String? otp = "";

  // set otp(otp) => _otp = otp;

  void onChange(val) {
    otp = val;
  }

  bool validate() {
    try {
      if (otp!.isEmpty) {
        throw InvalidException("please fill correct OTP", false);
      } else if (otp!.length < 4) {
        throw InvalidException("OTP must be 4 digits", false);
      } else {
        return true;
      }
    } catch (e) {
      handleError(e);
      return false;
    }
  }

  void verify() {
    bool status = validate();
  }
}
