import 'package:karmalab_assignment/views/home/home_view.dart';
import 'package:karmalab_assignment/views/onboarding/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void userLog({String? email, String? token, int? id, int? otp}) async {
    SharedPreferences pref = await _prefs;
    pref.setBool("login", true);
    pref.setString("email", email ?? "email");
    pref.setInt("id", id ?? 0);
    pref.setInt("otp", otp ?? 0);
  }

  Future<String> start() async {
    SharedPreferences pref = await _prefs;

    var status = pref.getBool("login");
    return status! ? HomeView.routeName : OnboardingView.routeName;
  }
}
