import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageModel extends ChangeNotifier {
  var remainingTapCountToBreakEgg;

  HomePageModel() : this.initialize();
  HomePageModel.initialize() {
    _getRemainingTapCountToBreakEgg();
  }

  Future<void> _getRemainingTapCountToBreakEgg() async {
    final _prefs = await SharedPreferences.getInstance();
    remainingTapCountToBreakEgg = _prefs.getInt('count') ?? 1000000;
    notifyListeners();
  }

  void eggTapped() {
    if (remainingTapCountToBreakEgg != null) {
      remainingTapCountToBreakEgg--;
    }
    else if (remainingTapCountToBreakEgg == 0) {
      return;
    }

    _setRemainingTapCountToBreakEgg();
    notifyListeners();
  }

  Future<void> _setRemainingTapCountToBreakEgg() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('count', remainingTapCountToBreakEgg);
  }

  Future<void> resetTapCount() async {
    remainingTapCountToBreakEgg = 1000000;
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('count', 1000000);
    notifyListeners();
  }
}