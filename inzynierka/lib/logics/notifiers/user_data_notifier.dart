import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/user_data_repository.dart';

import 'package:inzynierka/models/user_data.dart';

class UserDataNotifier extends ChangeNotifier {
  UserData _userData = UserData(
      firstName: '',
      secondName: '',
      heightValue: 0,
      weightValue: 0,
      ageValue: 0,
      dailyCaloriesLimit: 0,
      photoUrl: '');

  void loadUserData() async {
    _userData = await UserDataRepository().getUserData();
    notifyListeners();
  }

  void editUserInfo(UserData userData) {
    UserDataRepository().editUserInfo(userData);
    _userData = userData;
    notifyListeners();
  }

  UserData get userData {
    return _userData;
  }
}
