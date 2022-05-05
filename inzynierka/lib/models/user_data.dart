class UserData {
  UserData(
      {required this.firstName,
      required this.secondName,
      this.photoUrl,
      required this.heightValue,
      required this.weightValue,
      required this.ageValue,
      required this.dailyCaloriesLimit});

  String firstName;
  String secondName;
  String ?photoUrl;
  int heightValue;
  int weightValue;
  int ageValue;
  int dailyCaloriesLimit;
}
