import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inzynierka/globals/fitstat_appbar.dart';
import 'package:inzynierka/globals/global_widgets/buttons_row.dart';
import 'package:inzynierka/logics/hubs/user_data_repository.dart';
import 'package:inzynierka/logics/notifiers/user_data_notifier.dart';
import 'package:inzynierka/models/user_data.dart';
import 'package:inzynierka/ui/add_meal_screen/widget/fitstat_value_slider.dart';
import 'package:inzynierka/ui/profile_page.dart/widgets/rounded_image_from_file.dart';
import 'package:inzynierka/ui/profile_page.dart/widgets/rounded_image_from_network.dart';
import 'package:inzynierka/ui/profile_page.dart/widgets/user_info_section.dart';
import 'package:provider/provider.dart';

import '../add_meal_screen/widget/fitstat_textformfield.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  late final UserData userData;
  bool editable = false;

  final double backgroundPhotoHeight = 200;
  final double profilePictureHeight = 130;
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameValueController =
      TextEditingController();
  final TextEditingController _secondNameValueController =
      TextEditingController();
  late String name;
  late String secondName;
  late String photoUrl;
  late double heightValue = 0;
  late double weightValue = 0;
  late double ageValue = 0;
  late double dailyCaloriesLimit = 0;

  late File? profileImagePicked = null;

  bool? heightValidated;
  bool? weightValidated;
  bool? ageValidated;
  bool? dailyCaloriesLimitValidated;
  @override
  void initState() {
    super.initState();
    userData = Provider.of<UserDataNotifier>(context, listen: false).userData;

    setState(() {
      name = userData.firstName;
      secondName = userData.secondName;
      photoUrl = userData.photoUrl ?? '';
      heightValue = userData.heightValue.toDouble();
      weightValue = userData.weightValue.toDouble();
      ageValue = userData.ageValue.toDouble();
      dailyCaloriesLimit = userData.dailyCaloriesLimit.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FitStatAppBar(
        title: 'Edytuj Profil',
        // trailing: IconButton(
        //   onPressed: onEditTappped,
        //   icon: const Icon(
        //     Icons.edit_note_rounded,
        //   ),
        // ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      Image.network(
                          photoUrl.isEmpty
                              ? "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250"
                              : photoUrl,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          height: backgroundPhotoHeight),
                      const SizedBox(
                        height: 80,
                      ),
                      Text(name + " " + secondName,
                          style: Theme.of(context).textTheme.headline3),
                    ],
                  ),
                  Positioned(
                    top: backgroundPhotoHeight - profilePictureHeight / 2,
                    child: profileImagePicked != null
                        ? RoundedImageFromFile(
                            profilePictureHeight: profilePictureHeight,
                            profileImagePicked: profileImagePicked)
                        : RoundedImageFromNetwork(
                            profilePictureHeight: profilePictureHeight,
                            photoUrl: photoUrl),
                  ),
                  editable == true
                      ? Positioned(
                          bottom:
                              backgroundPhotoHeight - profilePictureHeight - 30,
                          right: MediaQuery.of(context).size.width / 2 - 75,
                          child: InkWell(
                            onTap: () => onEditPhotoTapped(),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ))
                      : const SizedBox.shrink()
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            editable == true
                ? Form(
                    key: _editProfileFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: FitStatTextFormFieldWithBorder(
                              placeholder: name,
                              productNameController: _firstNameValueController,
                              isReadOnly: false),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: FitStatTextFormFieldWithBorder(
                            placeholder: secondName,
                            productNameController: _secondNameValueController,
                            isReadOnly: false,
                          ),
                        ),
                        FitstatValueSlider(
                            sliderValue: heightValue,
                            hintText: 'Podaj swój wzrost',
                            onValueChange: (double value) {
                              setState(() {
                                heightValue = value;
                              });
                            },
                            unit: 'cm',
                            validated: heightValidated,
                            maxValue: 250),
                        const SizedBox(
                          height: 15,
                        ),
                        FitstatValueSlider(
                            sliderValue: weightValue,
                            hintText: 'Podaj swoją wagę ',
                            onValueChange: (double value) {
                              setState(() {
                                weightValue = value;
                              });
                            },
                            unit: 'kg',
                            validated: weightValidated,
                            maxValue: 200),
                        const SizedBox(
                          height: 15,
                        ),
                        FitstatValueSlider(
                            sliderValue: ageValue,
                            hintText: 'Podaj swój wiek ',
                            onValueChange: (double value) {
                              setState(() {
                                ageValue = value;
                              });
                            },
                            unit: 'lat',
                            validated: ageValidated,
                            maxValue: 110),
                        const SizedBox(
                          height: 15,
                        ),
                        FitstatValueSlider(
                            sliderValue: dailyCaloriesLimit,
                            hintText: 'Podaj swój dzienny limit kalorii',
                            onValueChange: (double value) {
                              setState(() {
                                dailyCaloriesLimit = value;
                              });
                            },
                            unit: 'kcal',
                            validated: dailyCaloriesLimitValidated,
                            maxValue: 5000),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ))
                : UserInfoSection(
                    ageValue: ageValue,
                    heightValue: heightValue,
                    weightValue: weightValue,
                    dailyCaloriesLimit: dailyCaloriesLimit,
                  ),
            const SizedBox(
              height: 35,
            ),
            editable == false
                ? Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: onEditTappped,
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: Text(
                            'Edytuj',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : ButtonsRow(
                    buttonText: 'Zapisz',
                    outlinedButtonText: 'Anuluj',
                    ontapButton: onSubmitPressed,
                    onTapButttonOutlined: onEditTappped),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  // Todo make form validation and send data to firebase also solve savin g photo to firestore data collection
  void onSubmitPressed() async {
    name = ((_firstNameValueController.text != name) &&
            _firstNameValueController.text.isNotEmpty &&
            (_firstNameValueController.text.length > 3))
        ? _firstNameValueController.text
        : name;
    secondName = ((_secondNameValueController.text != secondName) &&
            _secondNameValueController.text.isNotEmpty &&
            (_secondNameValueController.text.length > 3))
        ? _secondNameValueController.text
        : secondName;
    bool _passed2 = validateSliders();

    if (_passed2 == true || profileImagePicked != null) {
      Provider.of<UserDataNotifier>(context, listen: false).editUserInfo(
        UserData(
          firstName: name,
          secondName: secondName,
          photoUrl:
              profileImagePicked != null ? await addOrReplace() : photoUrl,
          heightValue: heightValue.toInt(),
          weightValue: weightValue.toInt(),
          ageValue: ageValue.toInt(),
          dailyCaloriesLimit: dailyCaloriesLimit.toInt(),
        ),
      );

      _editProfileFormKey.currentState!.reset();
      setState(() {
        editable = !editable;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dane nie zostały zmienione')));
    }
  }

  Future<String> addOrReplace() async {
    String _url = '';
    if (profileImagePicked != null && photoUrl.isNotEmpty) {
      _url = await UserDataRepository()
          .replaceImage(photoUrl, profileImagePicked!);
    }
    if (profileImagePicked != null && photoUrl.isEmpty) {
      _url = await UserDataRepository().uploadImage(profileImagePicked!);
    }
    return _url;
  }

  bool validateSliders() {
    if (heightValue > 0) {
      heightValidated = true;
    }
    if (weightValue > 0) {
      weightValidated = true;
    }
    if (ageValue > 0) {
      ageValidated = true;
    }
    if (dailyCaloriesLimit > 0) {
      dailyCaloriesLimitValidated = true;
    }
    if ((heightValidated == true && heightValidated != null) &&
        (weightValidated == true && weightValidated != null) &&
        (ageValidated == true && ageValidated != null) &&
        (dailyCaloriesLimitValidated != null &&
            dailyCaloriesLimitValidated == true)) {
      return true;
    } else {
      return false;
    }
  }

  void onEditTappped() {
    setState(() {
      editable = !editable;
    });
  }

  void onEditPhotoTapped() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        profileImagePicked = imageTemp;
      });
    } catch (e) {
      print(e);
    }
  }
}
