import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inzynierka/models/user_data.dart';

class UserDataDTO {
  String? firstName;
  String? secondName;
  String? photoUrl;
  int? heightValue;
  int? weightValue;
  int? ageValue;
  int? dailyCaloriesLimit;
  UserDataDTO(
      {required this.firstName,
      required this.secondName,
      required this.photoUrl,
      required this.heightValue,
      required this.weightValue,
      required this.ageValue,
      required this.dailyCaloriesLimit});

  UserDataDTO.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] as String,
        secondName = json['secondName'] as String,
        photoUrl = json['photoUrl'] as String,
        heightValue = json['heightValue'] as int,
        weightValue = json['weightValue'] as int,
        ageValue = json['ageValue'] as int,
        dailyCaloriesLimit = json['dailyCaloriesLimit'] as int;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'secondName': secondName,
        'photoUrl': photoUrl,
        'heightValue': heightValue,
        'weightValue': weightValue,
        'ageValue': ageValue,
        'dailyCaloriesLimit': dailyCaloriesLimit,
      };

  UserData toModel() {
    return UserData(
        firstName: firstName ?? '',
        secondName: secondName ?? '',
        photoUrl: photoUrl ?? '',
        heightValue: heightValue ?? 0,
        weightValue: weightValue ?? 0,
        ageValue: ageValue ?? 0,
        dailyCaloriesLimit: dailyCaloriesLimit ?? 0);
  }

  static UserDataDTO fromModel(UserData userData) {
    return UserDataDTO(
        firstName: userData.firstName,
        secondName: userData.secondName,
        photoUrl:userData.photoUrl,
        heightValue: userData.heightValue,
        weightValue: userData.weightValue,
        ageValue: userData.ageValue,
        dailyCaloriesLimit: userData.dailyCaloriesLimit);
  }

  static UserDataDTO fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserDataDTO(
        firstName: doc['firstName'],
        secondName: doc['secondName'],
        photoUrl: doc['photoUrl'],
        heightValue: doc['heightValue'],
        weightValue: doc['weightValue'],
        ageValue: doc['ageValue'],
        dailyCaloriesLimit: doc['dailyCaloriesLimit']);
  }
}
